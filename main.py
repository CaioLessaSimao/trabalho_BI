import pandas as pd
import sqlalchemy

# Conexões
relacional_engine = sqlalchemy.create_engine("mysql+pymysql://root:rootpass123@localhost:3306/dbnetf")
dimensional_engine = sqlalchemy.create_engine("mysql+pymysql://root:rootpass123@localhost:3306/Pagamento")

# 1. Carregar Dim_Data
def carregar_dim_data():
    df = pd.read_excel("Data.xls")
    print("📋 Colunas no Excel:", df.columns.tolist())

    df_selecionado = df[[
        'date key', 'month num overall', 'year', 'quarter'
    ]].rename(columns={
        'date key': 'id',
        'month num overall': 'mes',
        'year': 'ano',
        'quarter': 'trimestre'
    })

    ids_existentes = pd.read_sql("SELECT id FROM Dim_Data", con=dimensional_engine)
    novos = df_selecionado[~df_selecionado['id'].isin(ids_existentes['id'])]

    if not novos.empty:
        novos.to_sql('Dim_Data', con=dimensional_engine, if_exists='append', index=False)
        print(f"✅ Dim_Data: {len(novos)} registros adicionados.")
    else:
        print("ℹ️ Dim_Data já está atualizada.")

# 2. Carregar Dim_Localizacao
def carregar_dim_localizacao():
    df = pd.read_sql("""
    SELECT DISTINCT
        c.nmCidade AS cidade,
        e.nmEstado AS estado,
        p.nmPais AS pais
    FROM Usuario u
    JOIN Cidade c ON u.cidade_idCidade = c.idCidade
    JOIN Estado e ON u.estado_idEstado = e.idEstado
    JOIN Pais p ON u.pais_idPais = p.idPais
    """, con=relacional_engine)

    existentes = pd.read_sql("SELECT cidade, estado, pais FROM Dim_Localizacao", con=dimensional_engine)
    novos = df.merge(existentes, on=["cidade", "estado", "pais"], how="left", indicator=True)
    novos = novos[novos["_merge"] == "left_only"].drop(columns=["_merge"])

    if not novos.empty:
        max_id = pd.read_sql("SELECT MAX(id) as max_id FROM Dim_Localizacao", con=dimensional_engine)["max_id"].iloc[0]
        proximo_id = 1 if pd.isna(max_id) else int(max_id) + 1
        novos["id"] = range(proximo_id, proximo_id + len(novos))

        novos.to_sql('Dim_Localizacao', con=dimensional_engine, if_exists='append', index=False)
        print(f"✅ Dim_Localizacao: {len(novos)} registros adicionados.")
    else:
        print("ℹ️ Dim_Localizacao já está atualizada.")


# 3. Carregar Dim_Assinatura
def carregar_dim_assinatura():
    df = pd.read_sql("""
    SELECT DISTINCT
        idPlano AS id,
        1 AS EnumTipo,
        nmPlano AS `desc`
    FROM Plano
    """, con=relacional_engine)

    existentes = pd.read_sql("SELECT id FROM Dim_Assinatura", con=dimensional_engine)
    novos = df[~df["id"].isin(existentes["id"])]

    if not novos.empty:
        novos.to_sql('Dim_Assinatura', con=dimensional_engine, if_exists='append', index=False)
        print(f"✅ Dim_Assinatura: {len(novos)} registros adicionados.")
    else:
        print("ℹ️ Dim_Assinatura já está atualizada.")

# 4. Carregar Fato_Receita
def carregar_fato_receita():
    pagamentos = pd.read_sql("""
    SELECT
        pg.idPagamento AS id,
        CAST(REPLACE(pg.vlrRecebido, ',', '.') AS DECIMAL(12,2)) AS valor,
        pg.dtPagamento AS data_pagamento,
        a.Usuario_idUsuario AS usuario_id,
        a.Plano_idPlano AS plano_id
    FROM Pagamento pg
    JOIN Assinatura a ON pg.Assinatura_idAssinatura = a.idAssinatura
    """, con=relacional_engine)

    pagamentos['data_pagamento'] = pd.to_datetime(pagamentos['data_pagamento'])
    
    # Gerar o ID correto da data (YYYYMMDD da data exata)
    pagamentos['Dim_Data_id'] = pagamentos['data_pagamento'].dt.strftime('%Y%m%d').astype(int)
    
    # Debug: verificar os IDs gerados
    print("IDs de data gerados:", pagamentos['Dim_Data_id'].unique()[:10])
    
    # Verificar quais IDs existem na Dim_Data
    dim_data_ids = pd.read_sql("SELECT DISTINCT id FROM Dim_Data", con=dimensional_engine)
    ids_existentes = set(dim_data_ids['id'].values)
    ids_pagamentos = set(pagamentos['Dim_Data_id'].values)
    
    print(f"IDs na Dim_Data: {len(ids_existentes)}")
    print(f"IDs nos pagamentos: {len(ids_pagamentos)}")
    print(f"IDs que não existem na Dim_Data: {ids_pagamentos - ids_existentes}")
    
    # Filtrar apenas pagamentos com datas que existem na Dim_Data
    pagamentos_validos = pagamentos[pagamentos['Dim_Data_id'].isin(ids_existentes)]
    
    if len(pagamentos_validos) < len(pagamentos):
        faltando = len(pagamentos) - len(pagamentos_validos)
        print(f"⚠️ {faltando} pagamentos ignorados por não ter data correspondente na Dim_Data")
        print("Primeiras datas faltantes:", list(ids_pagamentos - ids_existentes)[:5])
    
    if pagamentos_validos.empty:
        print("❌ Nenhum pagamento com data válida encontrado!")
        return
    
    # Continuar com o resto do código usando pagamentos_validos
    usuarios = pd.read_sql("""
    SELECT
        u.idUsuario,
        c.nmCidade,
        e.nmEstado,
        p.nmPais
    FROM Usuario u
    JOIN Cidade c ON u.cidade_idCidade = c.idCidade
    JOIN Estado e ON u.estado_idEstado = e.idEstado
    JOIN Pais p ON u.pais_idPais = p.idPais
    """, con=relacional_engine)

    local_dim = pd.read_sql("SELECT * FROM Dim_Localizacao", con=dimensional_engine)
    usuarios_loc = usuarios.merge(local_dim,
        left_on=['nmCidade', 'nmEstado', 'nmPais'],
        right_on=['cidade', 'estado', 'pais'],
        how='left')[['idUsuario', 'id']].rename(columns={'id': 'Dim_Localizacao_id'})

    pagamentos_final = pagamentos_validos.merge(usuarios_loc, left_on='usuario_id', right_on='idUsuario', how='left')
    pagamentos_final['Dim_Assinatura_id'] = pagamentos_final['plano_id']

    fato_df = pagamentos_final[['id', 'valor', 'Dim_Data_id', 'Dim_Localizacao_id', 'Dim_Assinatura_id']]
    
    # Remover registros com valores nulos nas chaves estrangeiras
    fato_df = fato_df.dropna(subset=['Dim_Data_id', 'Dim_Localizacao_id', 'Dim_Assinatura_id'])
    
    existentes = pd.read_sql("SELECT id FROM Fato_Receita", con=dimensional_engine)
    novos = fato_df[~fato_df["id"].isin(existentes["id"])]

    if not novos.empty:
        novos.to_sql("Fato_Receita", con=dimensional_engine, if_exists="append", index=False)
        print(f"✅ Fato_Receita: {len(novos)} registros adicionados.")
    else:
        print("ℹ️ Fato_Receita já está atualizada.")

# Execução principal
if __name__ == "__main__":
    carregar_dim_data()
    carregar_dim_localizacao()
    carregar_dim_assinatura()
    carregar_fato_receita()
    print("🎉 ETL finalizado com sucesso.")

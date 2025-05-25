# Projeto de Data Warehouse - Netfil

Este repositório contém o projeto desenvolvido na disciplina de Inteligência de Negócios do curso de Sistemas de Informação do IFES - Campus Serra. O objetivo é construir um ambiente de Data Warehouse (DW) para uma empresa fictícia de streaming chamada Netfil, incluindo modelagem dimensional e implementação de um processo completo de ETL (Extração, Transformação e Carga).

## Autores

* Caio Lessa Simões
* Marcos Vinícius Souza dos Santos
* Sofia de Alcantara Silva

Professora: Kelly Assis de Souza Gazolli


## Estrutura do Repositório

```
trabalho_BI/
├── docker-compose.yml
├── scripts/
│   ├── dbnetf.sql               # Script de criação do banco relacional
│   ├── inserts_dbnetf.sql       # Script de inserção de dados no banco relacional
│   ├── pagamento.sql            # Script de criação do Data Mart (DW)
│   ├── pagamento_dump.sql       # Dump final do Data Mart após ETL
│   └── main.py                  # Script Python do processo ETL
├── data/
│   └── Data.xls                 # Planilha para geração da dimensão tempo
├── requirements.txt             # Dependências Python
├── README.md
```

## Tecnologias Utilizadas

* Python 3.10 ou superior
* MySQL 8.x
* Docker e Docker Compose
* MySQL Workbench
* Pandas e openpyxl (para manipulação de planilhas Excel)

## Instruções de Execução

### 1. Clonar o repositório

```bash
git clone https://github.com/seu-usuario/netfil-dw.git
cd trabalho_BI
```

### 2. Subir os serviços com Docker

Certifique-se de que o Docker e o Docker Compose estão instalados. Execute o comando:

```bash
docker-compose up -d
```

Isso iniciará um container MySQL acessível na porta 3306.

### 3. Criar os bancos e popular os dados

**Via MySQL Workbench:**

1. Acesse o banco com as credenciais do `docker-compose.yml`
2. Execute os seguintes scripts localizados em `scripts/`
    - `dbnetf.sql`
    - `inserts_dbnetf.sql`
    - `pagamento.sql`

### 4. Instalar as dependências do Python

Crie e ative um ambiente virtual (opcional):

```bash
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
```

Instale os pacotes:

```bash
pip install -r requirements.txt
```

Conteúdo do `requirements.txt`:

```
pandas
openpyxl
mysql-connector-python
```

### 5. Executar o processo ETL

O script `main.py` realiza a extração de dados do banco relacional `dbnetf`, a transformação dos dados de acordo com o modelo dimensional e a carga no banco de dados `pagamento`.

```bash
python scripts/main.py
```

Ao final da execução, o banco `pagamento` conterá as tabelas dimensionais e a tabela fato com os dados processados.

## Modelo Dimensional

O Data Mart foi projetado com base no processo de pagamento, com as seguintes tabelas:

* Dimensão Cliente
* Dimensão Plano
* Dimensão Tempo (gerada a partir da planilha `Data.xls`)
* Fato Pagamento

Essa estrutura permite análises como:

* Receita por mês, plano ou cliente
* Total de novos assinantes em determinado período
* Correlação entre planos e avaliações

## Exploração do Data Mart

Após a execução do ETL, é possível utilizar ferramentas de BI para construir dashboards conectando-se ao banco `pagamento`.

O dump final do banco de dados dimensional pode ser encontrado em:

```
scripts/pagamento_dump.sql
```

Esse arquivo pode ser utilizado para restaurar o estado final do DW em outro ambiente.

## Observações

* O projeto pode ser estendido com novas dimensões (como conteúdo ou dispositivo de acesso) conforme novas necessidades analíticas forem identificadas.
* A execução do ETL pode ser automatizada com ferramentas como Apache Airflow.

## Licença

Este projeto foi desenvolvido exclusivamente para fins acadêmicos e não possui licença comercial.

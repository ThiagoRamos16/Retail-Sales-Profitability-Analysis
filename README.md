# Retail Sales & Profitability Analysis

## Sobre o projeto

Este projeto tem como objetivo analisar o desempenho comercial de uma base de dados de varejo, utilizando SQL Server para realizar o tratamento, a validação e a análise dos dados.

A análise busca identificar padrões de vendas e lucratividade, avaliando o desempenho por categorias, subcategorias, descontos, períodos, regiões e segmentos de clientes.

## Objetivos da análise

- Avaliar o desempenho geral de vendas e lucro.
- Identificar categorias e subcategorias com maior e menor rentabilidade.
- Analisar a relação entre descontos e lucratividade.
- Investigar a evolução mensal das vendas e dos lucros.
- Comparar o desempenho entre regiões e segmentos de clientes.

## Base de dados

- **Fonte:** [Superstore Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Registros após tratamento:** 9.993
- **Período analisado:** 2014 a 2017.

## Ferramentas utilizadas

- SQL Server
- SQL

## Etapas do projeto

1. **Importação dos dados:** carregamento da base original no SQL Server.
2. **Tratamento dos dados:** conversão de tipos, padronização e remoção de registro duplicado.
3. **Validação:** verificação da integridade e qualidade dos dados tratados.
4. **Análise exploratória:** consultas SQL para investigar indicadores e padrões de negócio.
5. **Documentação:** registro dos principais resultados e descobertas da análise.

## Principais resultados

- **Vendas totais:** R$ 2.296.919,49.
- **Lucro total:** R$ 286.409,08.
- **Margem geral:** 12,47%.
- **Categoria com maior lucro:** Technology.
- **Subcategoria com maior prejuízo:** Tables.
- **Região com maior lucro:** West.

A análise também identificou uma associação entre maiores faixas de desconto e menores margens de lucro.

## Estrutura do projeto

```text
Retail-Sales-Profitability-Analysis/
│
├── sql/
│   ├── 01_tratamento.sql
│   ├── 02_validacao_tratamento.sql
│   └── 03_analise_negocio.sql
│
├── docs/
│   └── insights.md
│
├── powerbi/
│   └── dashboard.pbix
│
└── README.md
```

### Organização dos arquivos

- **sql/**: scripts SQL utilizados no tratamento, validação e análise dos dados.
- **docs/**: documentação dos principais insights identificados.
- **powerbi/**: arquivo do dashboard desenvolvido no Power BI.
- **README.md**: apresentação e documentação geral do projeto.


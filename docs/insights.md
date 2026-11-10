# Insights da Análise — Superstore

## 1. Objetivo

Analisar o desempenho comercial da Superstore, identificando padrões de vendas, lucro e rentabilidade por categoria, subcategoria, faixa de desconto, período, região e segmento de clientes.

## 2. Indicadores gerais

- **Total de registros:** 9.993
- **Total de pedidos:** 5.009
- **Vendas totais:** R$ 2.296.919,49
- **Lucro total:** R$ 286.409,08
- **Margem geral:** 12,47%

## 3. Principais descobertas

### 3.1 Categorias e subcategorias

- Technology apresentou o maior faturamento (R$ 836.154,03) e lucro (R$ 145.454,95).
- Furniture apresentou margem de apenas 2,49%, apesar do volume expressivo de vendas.
- Tables registrou o maior prejuízo entre as subcategorias: R$ 17.725,48.
- Bookcases e Supplies também apresentaram resultados negativos.

**Insight:** maior volume de vendas não significa necessariamente maior lucratividade. A categoria Furniture merece atenção devido à sua baixa margem.

### 3.2 Descontos e rentabilidade

| Faixa de desconto | Margem |
|---|---:|
| Sem desconto | 29,51% |
| Até 20% | 11,91% |
| Acima de 20% até 40% | -15,31% |
| Acima de 40% | -77,40% |

**Insight:** os resultados mostram uma associação entre maiores descontos e menor rentabilidade, com margens negativas nas faixas acima de 20%.

### 3.3 Evolução mensal

- **Maior faturamento:** novembro de 2017 — R$ 118.447,83.
- **Maior lucro:** dezembro de 2016 — R$ 17.885,31.
- **Maior margem:** outubro de 2016 — 27,21%.
- **Maior prejuízo:** janeiro de 2015 — R$ 3.281,01 negativos.

**Insight:** o mês com maior faturamento não foi o mesmo com maior lucro, reforçando a importância de acompanhar diferentes indicadores de desempenho.

### 3.4 Desempenho regional

- **West:** maior lucro, com R$ 108.418,45 e margem de 14,94%.
- **Central:** menor margem, com 7,92%.
- **East:** margem de 13,49%.
- **South:** margem de 11,93%.

**Insight:** existem diferenças de rentabilidade entre as regiões. Central merece atenção por apresentar a menor margem.

### 3.5 Segmentos de clientes

- **Consumer:** maior faturamento (R$ 1.161.401,35) e maior lucro (R$ 134.119,21).
- **Home Office:** maior margem de lucro, com 14,05%.
- **Corporate:** margem de 13,03%.
- **Consumer:** margem de 11,55%.

**Insight:** Consumer representa o maior volume de vendas e lucro, enquanto Home Office apresenta a melhor margem de rentabilidade.

## 4. Conclusão

A análise identificou diferenças relevantes de desempenho entre categorias, subcategorias, faixas de desconto, regiões e segmentos de clientes.

Os resultados mostram que faturamento elevado não garante maior lucratividade e que descontos mais altos estão associados a margens menores.

Essas descobertas ajudam a identificar produtos e regiões que merecem atenção, além de oportunidades para melhorar a rentabilidade do negócio.

## 5. Ferramentas utilizadas

- SQL Server
- SQL

## 6. Fonte dos dados

[Superstore Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

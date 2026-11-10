
USE Superstore;
GO

-- =============================================
-- 03. ANALISE DE NEGOCIO
-- Objetivo: analisar vendas, lucro e rentabilidade
-- =============================================


-- 1. Indicadores gerais
SELECT
    COUNT(*) AS total_registros,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,
    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual,
    ROUND(AVG(sales), 2) AS media_vendas_por_registro
FROM dbo.superstore_tratado;


-- 2. Desempenho por categoria
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,
    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual
FROM dbo.superstore_tratado
GROUP BY category
ORDER BY total_vendas DESC;


-- 3. Rentabilidade por categoria e subcategoria
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,
    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual
FROM dbo.superstore_tratado
GROUP BY
    category,
    sub_category
ORDER BY total_lucro ASC;


-- 4. Análise de rentabilidade por faixa de desconto
SELECT
    CASE
        WHEN discount = 0 THEN 'Sem desconto'
        WHEN discount <= 0.20 THEN 'Até 20%'
        WHEN discount <= 0.40 THEN 'Acima de 20% até 40%'
        ELSE 'Acima de 40%'
    END AS faixa_desconto,

    COUNT(*) AS total_registros,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,

    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual

FROM dbo.superstore_tratado

GROUP BY
    CASE
        WHEN discount = 0 THEN 'Sem desconto'
        WHEN discount <= 0.20 THEN 'Até 20%'
        WHEN discount <= 0.40 THEN 'Acima de 20% até 40%'
        ELSE 'Acima de 40%'
    END

ORDER BY MIN(discount);


-- 5. Evolução mensal de vendas e lucro
SELECT
    YEAR(order_date) AS ano,
    MONTH(order_date) AS mes,

    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,

    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual

FROM dbo.superstore_tratado

GROUP BY
    YEAR(order_date),
    MONTH(order_date)

ORDER BY
    ano,
    mes;


-- 6. Análise de desempenho por região
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,

    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual

FROM dbo.superstore_tratado

GROUP BY region

ORDER BY total_lucro DESC;


-- 7. Análise de desempenho por segmento
SELECT
    segment,
    COUNT(DISTINCT order_id) AS total_pedidos,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,

    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual

FROM dbo.superstore_tratado

GROUP BY segment

ORDER BY total_lucro DESC;

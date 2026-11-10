
USE Superstore;
GO

-- =============================================
-- 02. VALIDACAO DO TRATAMENTO
-- Objetivo: verificar a integridade dos dados
-- da tabela dbo.superstore_tratado
-- =============================================


-- 1. Verificar quantidade total de registros
SELECT
    COUNT(*) AS total_linhas
FROM dbo.superstore_tratado;
-- Esperado: 9993


-- 2. Verificar valores nulos em colunas importantes
SELECT *
FROM dbo.superstore_tratado
WHERE row_id IS NULL
   OR order_id IS NULL
   OR order_date IS NULL
   OR ship_date IS NULL
   OR sales IS NULL
   OR quantity IS NULL
   OR discount IS NULL
   OR profit IS NULL;
-- Esperado: nenhuma linha


-- 3. Verificar datas inválidas
SELECT *
FROM dbo.superstore_tratado
WHERE order_date IS NULL
   OR ship_date IS NULL;
-- Esperado: nenhuma linha


-- 4. Verificar datas de envio anteriores à data do pedido
SELECT *
FROM dbo.superstore_tratado
WHERE ship_date < order_date;
-- Esperado: nenhuma linha


-- 5. Verificar tipos de dados das colunas
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    NUMERIC_PRECISION,
    NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'superstore_tratado'
  AND COLUMN_NAME IN (
      'row_id',
      'sales',
      'quantity',
      'discount',
      'profit'
  )
ORDER BY ORDINAL_POSITION;


-- 6. Verificar se o registro duplicado foi removido
SELECT
    row_id,
    order_id,
    product_id,
    sales,
    quantity,
    profit
FROM dbo.superstore_tratado
WHERE row_id IN (3406, 3407);
-- Esperado: somente o Row ID 3406


-- 7. Comparar registros da origem com a tabela tratada
-- Esperado: somente o Row ID 3407
SELECT CONVERT(INT, Row_ID) AS row_id
FROM dbo.superstore
EXCEPT
SELECT row_id
FROM dbo.superstore_tratado;


-- 8. Verificar se existem registros tratados
-- que não estão presentes na origem
-- Esperado: nenhuma linha
SELECT row_id
FROM dbo.superstore_tratado
EXCEPT
SELECT CONVERT(INT, Row_ID)
FROM dbo.superstore;


-- 9. Verificar descontos fora do intervalo permitido
SELECT *
FROM dbo.superstore_tratado
WHERE discount < 0
   OR discount > 1;
-- Esperado: nenhuma linha


-- 10. Verificar valores negativos de quantidade
SELECT *
FROM dbo.superstore_tratado
WHERE quantity < 0;
-- Esperado: nenhuma linha


-- 11. Conferir indicadores gerais da base tratada
SELECT
    COUNT(*) AS total_linhas,
    ROUND(SUM(sales), 2) AS total_vendas,
    ROUND(SUM(profit), 2) AS total_lucro,
    ROUND(
        SUM(profit) * 100.0 / NULLIF(SUM(sales), 0),
        2
    ) AS margem_percentual,
    COUNT(CASE WHEN profit < 0 THEN 1 END)
        AS registros_prejuizo
FROM dbo.superstore_tratado;

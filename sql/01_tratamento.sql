
USE Superstore;
GO

-- 1. Criar a tabela tratada
DROP TABLE IF EXISTS dbo.superstore_tratado;
GO

CREATE TABLE dbo.superstore_tratado (
    row_id INT,
    order_id NVARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode NVARCHAR(50),
    customer_id NVARCHAR(50),
    customer_name NVARCHAR(150),
    segment NVARCHAR(50),
    country NVARCHAR(100),
    city NVARCHAR(100),
    state NVARCHAR(100),
    postal_code NVARCHAR(20),
    region NVARCHAR(50),
    product_id NVARCHAR(50),
    category NVARCHAR(100),
    sub_category NVARCHAR(100),
    product_name NVARCHAR(500),
    sales DECIMAL(18,4),
    quantity INT,
    discount DECIMAL(5,4),
    profit DECIMAL(18,4)
);
GO

-- 2. Inserir os dados com conversão dos tipos
INSERT INTO dbo.superstore_tratado (
    row_id, order_id, order_date, ship_date,
    ship_mode, customer_id, customer_name, segment,
    country, city, state, postal_code, region,
    product_id, category, sub_category, product_name,
    sales, quantity, discount, profit
)
SELECT
    TRY_CONVERT(INT, [Row_ID]),
    [Order_ID],
    TRY_CONVERT(DATE, [Order_Date], 101),
    TRY_CONVERT(DATE, [Ship_Date], 101),
    [Ship_Mode],
    [Customer_ID],
    [Customer_Name],
    [Segment],
    [Country],
    [City],
    [State],
    [Postal_Code],
    [Region],
    [Product_ID],
    [Category],
    [Sub_Category],
    [Product_Name],
    TRY_CONVERT(DECIMAL(18,4), [Sales]),
    TRY_CONVERT(INT, [Quantity]),
    TRY_CONVERT(DECIMAL(5,4), [Discount]),
    TRY_CONVERT(DECIMAL(18,4), [Profit])
FROM dbo.superstore;

GO

-- 3. Remover registro duplicado documentado
DELETE FROM dbo.superstore_tratado
WHERE row_id = 3407;

GO

-- 4. Conferir quantidade de registros
SELECT COUNT(*) AS total_linhas
FROM dbo.superstore_tratado;

-- 5. Verificar datas inválidas
SELECT *
FROM dbo.superstore_tratado
WHERE order_date IS NULL
   OR ship_date IS NULL;

-- 6. Verificar datas de envio anteriores ao pedido
SELECT *
FROM dbo.superstore_tratado
WHERE ship_date < order_date;

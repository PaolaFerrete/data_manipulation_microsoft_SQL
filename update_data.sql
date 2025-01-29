SELECT * FROM PRODUTOS;

-- Alterando preço de lista
UPDATE PRODUTOS SET PRECO_LISTA = 5
WHERE CODIGO = '1040107';

SELECT * FROM PRODUTOS;

UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.10
WHERE SABOR = 'Manga';

SELECT * FROM PRODUTOS;

-- Alterando tamanho do produto
UPDATE PRODUTOS SET DESCRITOR = REPLACE(DESCRITOR, '350 ml', '550 ml'), TAMANHO = '550 ml'
WHERE SABOR = 'Manga';

SELECT * FROM PRODUTOS WHERE SABOR = 'Manga';

-- Alterando o endereço do cliente
UPDATE CLIENTES SET ENDERECO = 'R. Jorge Emilio 23', BAIRRO = 'Santo Amaro', CIDADE = 'São Paulo', ESTADO = 'SP', CEP = '8833223'
WHERE CPF = '19290992743';

SELECT * FROM CLIENTES WHERE CPF = '19290992743';

-- Alterando o volume de compra
UPDATE CLIENTES SET VOLUME_COMPRA = VOLUME_COMPRA * 1.2
WHERE ESTADO = 'RJ';

SELECT * FROM CLIENTES WHERE ESTADO = 'RJ';

-- Alteração de valores de uma tabela como referência uma tabela em outro banco de dados
-- Consulta com join
SELECT A.CODIGO AS CODIGO, A.PRECO_LISTA AS PRECO_LISTA,
B.CODIGO_DO_PRODUTO AS CODIGO_APOIO, B.PRECO_DE_LISTA AS PRECO_APOIO
FROM PRODUTOS A
JOIN SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS B
ON A.CODIGO = B.CODIGO_DO_PRODUTO;

-- O mesmo processo utilizando merge
MERGE INTO PRODUTOS A 
USING SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS B 
ON A.CODIGO = B.CODIGO_DO_PRODUTO 
WHEN MATCHED THEN 
UPDATE SET A.PRECO_LISTA = B.PRECO_DE_LISTA;

-- Alteração de valores da tabela Produtos
UPDATE A SET A.PRECO_LISTA = B.PRECO_DE_LISTA
FROM PRODUTOS A
JOIN SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS B
ON A.CODIGO = B.CODIGO_DO_PRODUTO; 

-- Aumento de 30% no volume de compra de clintes que moram no mesmo bairro que os vendedores
UPDATE A SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.3
FROM CLIENTES A
JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO;

-- Aumento de 30% no volume de compra de clintes que moram no mesmo bairro que os vendedores USANDO MERGE
MERGE INTO CLIENTES A
USING VENDEDORES B
ON A.BAIRRO = B.BAIRRO
WHEN MATCHED THEN
UPDATE SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.3;

SELECT * FROM CLIENTES;
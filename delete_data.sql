-- Adicionando novos dados
 INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
     ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),
     ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
     ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
     ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
     ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),
     ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
     ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
     ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
     ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
     ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
     ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);

SELECT * FROM PRODUTOS WHERE SUBSTRING([DESCRITOR], 1,15) = 'Sabor dos Alpes';

-- Deletando linha de acordo com a chave primária
DELETE FROM PRODUTOS WHERE CODIGO = '1001000';

SELECT * FROM PRODUTOS WHERE CODIGO = '1001000';

-- Deletando produtos com descritor sabor dos Alpes e tamanho de 1 L
DELETE FROM PRODUTOS 
WHERE SUBSTRING([DESCRITOR], 1, 15) = 'Sabor dos Alpes' AND TAMANHO = '1 Litro';

SELECT * FROM PRODUTOS WHERE SUBSTRING([DESCRITOR], 1, 15) = 'Sabor dos Alpes';

-- Deletando notas de clientes menores de 18 anos

DELETE NV
FROM NOTAS_VENDAS NV
JOIN CLIENTES C
ON C.CPF = NV.CPF
WHERE C.IDADE < 18;

SELECT * 
FROM NOTAS_VENDAS NV
JOIN CLIENTES C
ON C.CPF = NV.CPF
WHERE C.IDADE < 18;


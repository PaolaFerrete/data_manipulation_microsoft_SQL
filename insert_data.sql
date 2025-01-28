--Insert data into table produtos
INSERT INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES 
    ('1040107', 'Light - 350 ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.56),
    ('1040108', 'Light - 350 ml - Graviola' , 'Graviola', '350 ml', 'Lata', 4.00),
    ('1040109', 'Light - 350 ml - Açai' , 'Açai', '350 ml', 'Lata', 5.60),
    ('1040110', 'Light - 350 ml - Jaca' , 'Jaca', '350 ml', 'Lata', 3.50),
    ('1040111', 'Light - 350 ml - Manga' , 'Manga', '350 ml', 'Lata', 3.20), 
    ('1040112', 'Light - 350 ml - Maça' , 'Maça', '350 ml', 'Lata', 4.20);

SELECT * FROM PRODUTOS;

--insert data into table clientes
INSERT INTO CLIENTES (
    CPF, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO, IDADE, GENERO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA
) VALUES
    ('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', '80012212', '19900901', 27, 'F', 170000, 24500, 0),
    ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', '20000212', 18, 'M', 100000, 20000, 1),
    ('2600586709', 'César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '20000312', 18, 'M', 120000, 22000, 0);

SELECT * FROM CLIENTES;


-- insert data from the file sucos_frutas.bak 
INSERT INTO CLIENTES
    SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, 
    DATA_DE_NASCIMENTO AS DATA_NASCIMENTO, IDADE, GENERO, 
    LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA, PRIMEIRA_COMPRA 
    FROM SUCOS_FRUTAS.DBO.TABELA_DE_CLIENTES
WHERE CPF  NOT IN ('19290992743', '1471156710', '2600586709');

INSERT INTO PRODUTOS
    SELECT 
    CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO AS DESCRITOR,
    SABOR AS SABOR,  
    TAMANHO AS TAMANHO,
    EMBALAGEM AS EMBALAGEM, 
    PRECO_DE_LISTA AS PRECO_LISTA
    FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS
    WHERE CODIGO_DO_PRODUTO <> '1040107';

SELECT * FROM PRODUTOS;


--insert data into vendedores
INSERT INTO VENDEDORES (
    MATRICULA, NOME, COMISSAO, DATA_ADMISSAO, FERIAS, BAIRRO
) VALUES
    ('235', 'Márcio Almeida Silva', 0.08, '15/08/2014', 0, 'Tijuca'),
    ('236',   'Cláudia Morais', 0.08, '17/09/2013', 1, 'Jardins'),
    ('237', 'Roberta Martins', 0.11, '18/03/2017', 1, 'Copacabana'),
    ('238', 'Péricles Alves', 0.11, '21/08/2016', 0, 'Santo Amaro');

SELECT * FROM VENDEDORES;

-- insert data from csv (using assistent to create a new table)
ALTER TABLE TABELA_VENDAS
ADD CONSTRAINT FK_CLIENTES
FOREIGN KEY (CPF) REFERENCES CLIENTES(CPF);

ALTER TABLE TABELA_VENDAS
ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES(MATRICULA);

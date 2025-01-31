-- Criando begin transaction com commit

SELECT * FROM VENDEDORES;

BEGIN TRANSACTION

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.1;

SELECT * FROM VENDEDORES;

COMMIT;

SELECT * FROM VENDEDORES;

-- begin transaction com rollback

SELECT * FROM VENDEDORES;

BEGIN TRANSACTION

INSERT INTO VENDEDORES
VALUES(
    '239', 'Maria Joana', 'Copacabana', '0.2', '2015-01-01', 1
);

SELECT * FROM VENDEDORES;

ROLLBACK;

SELECT * FROM VENDEDORES;
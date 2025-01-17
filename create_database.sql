--create database
CREATE DATABASE [VENDAS SUCOS];

--create database and configuration
CREATE DATABASE [VENDAS SUCOS 2] 
ON (
    NAME = 'VENDAS_SUCOS_2_DAT', 
    FILENAME ='/var/opt/mssql/data.mdf', 
    SIZE = 10, 
    MAXSIZE = 50, 
    FILEGROWTH = 5
) 
LOG ON (
    NAME = 'VENDAS_SUCOS_2_LOG', 
    FILENAME ='/var/opt/mssql/data.ldf', 
    SIZE = 10, 
    MAXSIZE = 50, 
    FILEGROWTH = 5
);

--drop database
DROP DATABASE [VENDAS SUCOS 2];
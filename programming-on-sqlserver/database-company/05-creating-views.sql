/*Exercícios 
Criando views
Banco de dados EMPRESA*/

USE dbEmpresa
GO

/*Cria uma view chamada V_EMP*/
CREATE VIEW V_EMP(EMPNO, NOME, CARGO, DEPTNO)
AS
SELECT e.EMPNO, e.NOME, e.CARGO, d.DEPTNO
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GO


/*Exibe informações da view a partir da consulta da view de sistema*/
SELECT * FROM INFORMATION_SCHEMA.VIEWS 

/*Exibe informações sobre as colunas que a view possui a partir da consulta da view de sistema*/
SELECT * FROM INFORMATION_SCHEMA.VIEW_COLUMN_USAGE

/*Exibe os dados de todos os empregados através da view.*/
SELECT *
FROM V_EMP

/*Exibe os nomes dos empregados, seu cargo, e o nome dos departamentos onde trabalham, utilizando a view.*/
SELECT e.NOME, e.CARGO, d.NOME
FROM V_EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO

/*Exibe as informações sobre a view a partir da view do sistema*/
SELECT * FROM INFORMATION_SCHEMA.VIEWS

/*Exibe informações sobre as colunas que a view possui a partir da consulta da view de sistema*/
SELECT * FROM INFORMATION_SCHEMA.VIEW_COLUMN_USAGE

/*Exibe todos os empregados de Dallas que possuam o cargo "ANALISTA"*/
SELECT nome, cargo
FROM V_EMP_DALLAS
WHERE CARGO = 'ANALISTA'

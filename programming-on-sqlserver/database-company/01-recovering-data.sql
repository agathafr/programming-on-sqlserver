--Lista de Exerc�cios: Recuperando dados

--Banco de dados dbEmpresa

USE dbEmpresa

/*1. exibi��o da estrutura da tabela emp*/
EXEC SP_HELP 'dbo.EMP'; 

/* 2. exibi��o da estrutura da tabela dept*/
EXEC SP_HELP 'dbo.DEPT'; 

/* 3. exibi��o de todos os dados e de todas as colunas da tabela emp*/
SELECT * 
FROM dbo.EMP; 

/* 4. exibi��o de todos os dados e de todas as colunas da tabela dept*/
SELECT * 
FROM dbo.DEPT; 

/* 5. exibi��o do nome dos empregados e do c�digo dos departamentos da tabela emp*/
SELECT NOME, DEPTNO
FROM dbo.EMP; 

/* 6. exibi��o do nome e do c�digo dos departamentos da tabela dept*/
SELECT NOME, DEPTNO
FROM dbo.EMP; 

/* 7. exibi��o dos nomes dos departamentos concatenados com o local em que se encontram*/
SELECT nome + loc 
AS Nome_Local 
FROM dept; 

/* 8. exibi��o dos departamentos onde os empregados trabalham sem linhas duplicadas.*/
SELECT DISTINCT deptno 
FROM emp; 

/* 9 . exibi��o do nome dos empregados e de seus respectivos sal�rio  multiplicados por 12;
- cria��o de uma coluna nomeada como Salario_Atual;
- especifica��o da tabela onde os comandos acima foram executados;*/ 
SELECT nome, salario * 12 
AS Salario_Anual 
FROM EMP; 

/* 10. exibi��o do c�digo dos empregados e de seus respectivos sal�rios somados � sua comiss�o
- cria��o de uma coluna nomeada como Salario_Mais_Comissao*/
SELECT deptno, salario + comissao 
AS Salario_Mais_Comissao 
FROM emp; 

/* 11. remo��o das linhas duplicadas na coluna cargo*/
SELECT DISTINCT cargo 
FROM emp;

/* 12 .exibi��o do nome e do cargo do empregado separado por v�rgula e espa�o
foi criada uma coluna que foi nomeada como "Empregado e Cargo"*/
SELECT nome + ', ' + cargo 
AS "Empregado e Cargo" 
FROM emp;



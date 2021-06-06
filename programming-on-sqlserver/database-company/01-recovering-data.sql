--Lista de Exercícios: Recuperando dados

--Banco de dados dbEmpresa

USE dbEmpresa

/*1. exibição da estrutura da tabela emp*/
EXEC SP_HELP 'dbo.EMP'; 

/* 2. exibição da estrutura da tabela dept*/
EXEC SP_HELP 'dbo.DEPT'; 

/* 3. exibição de todos os dados e de todas as colunas da tabela emp*/
SELECT * 
FROM dbo.EMP; 

/* 4. exibição de todos os dados e de todas as colunas da tabela dept*/
SELECT * 
FROM dbo.DEPT; 

/* 5. exibição do nome dos empregados e do código dos departamentos da tabela emp*/
SELECT NOME, DEPTNO
FROM dbo.EMP; 

/* 6. exibição do nome e do código dos departamentos da tabela dept*/
SELECT NOME, DEPTNO
FROM dbo.EMP; 

/* 7. exibição dos nomes dos departamentos concatenados com o local em que se encontram*/
SELECT nome + loc 
AS Nome_Local 
FROM dept; 

/* 8. exibição dos departamentos onde os empregados trabalham sem linhas duplicadas.*/
SELECT DISTINCT deptno 
FROM emp; 

/* 9 . exibição do nome dos empregados e de seus respectivos salário  multiplicados por 12;
- criação de uma coluna nomeada como Salario_Atual;
- especificação da tabela onde os comandos acima foram executados;*/ 
SELECT nome, salario * 12 
AS Salario_Anual 
FROM EMP; 

/* 10. exibição do código dos empregados e de seus respectivos salários somados à sua comissão
- criação de uma coluna nomeada como Salario_Mais_Comissao*/
SELECT deptno, salario + comissao 
AS Salario_Mais_Comissao 
FROM emp; 

/* 11. remoção das linhas duplicadas na coluna cargo*/
SELECT DISTINCT cargo 
FROM emp;

/* 12 .exibição do nome e do cargo do empregado separado por vírgula e espaço
foi criada uma coluna que foi nomeada como "Empregado e Cargo"*/
SELECT nome + ', ' + cargo 
AS "Empregado e Cargo" 
FROM emp;



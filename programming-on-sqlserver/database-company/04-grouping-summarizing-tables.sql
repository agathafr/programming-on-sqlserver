/*Exercícios 
Agrupando e Resumindo dados*/

--Banco de dados EMPRESA
USE dbEmpresa

/*Exibe total de empregados sem comissão*/
SELECT COUNT(ISNULL(comissao, 0)) "Empregados sem comissão"
FROM EMP;

/*Exibe total de empregados com comissão*/
SELECT COUNT(comissao) "Empregados com comissão"
FROM EMP;

/*Exibe o menor e o maior salário da empresa*/
SELECT MIN(salario) "Mínimo", MAX(salario) "Máximo"
FROM EMP 

/*Exibe o maior e o menor salário considerando apenas os departamentos 10 e 20.*/
SELECT MIN(salario) "Mínimo", MAX(salario) "Máximo"
FROM EMP 
WHERE DEPTNO IN (10,20);

/*Exibe a média salarial dos empregados que ganham mais de R$ 2000,00*/
SELECT SUM(salario) "Soma", AVG(salario) "Média"
FROM EMP
WHERE salario > 2000;

/*Exibe a data da primeira e da última contratação de um empregado.*/
SELECT MIN(DATACONTRATACAO) "Primeira", MAX(DATACONTRATACAO) "Última"
FROM EMP;

/*Exite total de cargos da tabela*/
SELECT COUNT(CARGO)
FROM EMP

/*Exibe total de gerentes existentes na tabela emp*/
SELECT COUNT(GERENTE)
FROM EMP

/*Exibe departamentos com pelo menos 1 empregado.*/
SELECT COUNT(DEPTNO) 
FROM DEPT
WHERE DEPTNO IS NOT NULL

/*Exibe a quantidade de empregados da tabela EMP separados por cargo e departamento.*/
SELECT CARGO, DEPTNO, COUNT(EMPNO) "Quantidade de empregados"
FROM EMP
GROUP BY CARGO, DEPTNO;

/*Exibe o código, o nome dos departamentos com mais de 4 empregados, e o maior salário deles.*/
SELECT d.DEPTNO, d.nome, MAX(SALARIO) "Maior Salário"
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.NOME
HAVING COUNT (*) > 4

SELECT *
FROM DEPT;

SELECT *
FROM EMP;

/*Exibe o código dos gerentes (coluna GERENTE) e a quantidade de empregados gerenciados por ele.*/
SELECT gerente codGERENTE, COUNT(EMPNO) "Quantidade de empregados gerenciados" 
FROM EMP
GROUP BY gerente;

/*Exibe o código e o nome do departamento, sua média salarial, mas somente para os departamentos que possuem o salário mínimo maior que R$ 1000.*/
SELECT d.DEPTNO, d.NOME, AVG(SALARIO) "Média Salarial"
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.NOME
HAVING AVG (SALARIO) > 1000;

/*Exibe o salário, o código e nome dos 3 empregados que possuem o menor salário dentro da empresa. */
SELECT TOP 3 empno, nome, salario 
FROM EMP
ORDER BY salario;

/*Exibir os dois cargos que possuem maior média salarial dentro da empresa.*/
SELECT TOP 2 cargo, salario
FROM EMP
GROUP BY cargo, salario
ORDER BY avg (salario) desc;
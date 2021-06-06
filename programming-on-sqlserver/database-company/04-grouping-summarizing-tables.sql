/*Exerc�cios 
Agrupando e Resumindo dados*/

--Banco de dados EMPRESA
USE dbEmpresa

/*Exibe total de empregados sem comiss�o*/
SELECT COUNT(ISNULL(comissao, 0)) "Empregados sem comiss�o"
FROM EMP;

/*Exibe total de empregados com comiss�o*/
SELECT COUNT(comissao) "Empregados com comiss�o"
FROM EMP;

/*Exibe o menor e o maior sal�rio da empresa*/
SELECT MIN(salario) "M�nimo", MAX(salario) "M�ximo"
FROM EMP 

/*Exibe o maior e o menor sal�rio considerando apenas os departamentos 10 e 20.*/
SELECT MIN(salario) "M�nimo", MAX(salario) "M�ximo"
FROM EMP 
WHERE DEPTNO IN (10,20);

/*Exibe a m�dia salarial dos empregados que ganham mais de R$ 2000,00*/
SELECT SUM(salario) "Soma", AVG(salario) "M�dia"
FROM EMP
WHERE salario > 2000;

/*Exibe a data da primeira e da �ltima contrata��o de um empregado.*/
SELECT MIN(DATACONTRATACAO) "Primeira", MAX(DATACONTRATACAO) "�ltima"
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

/*Exibe o c�digo, o nome dos departamentos com mais de 4 empregados, e o maior sal�rio deles.*/
SELECT d.DEPTNO, d.nome, MAX(SALARIO) "Maior Sal�rio"
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.NOME
HAVING COUNT (*) > 4

SELECT *
FROM DEPT;

SELECT *
FROM EMP;

/*Exibe o c�digo dos gerentes (coluna GERENTE) e a quantidade de empregados gerenciados por ele.*/
SELECT gerente codGERENTE, COUNT(EMPNO) "Quantidade de empregados gerenciados" 
FROM EMP
GROUP BY gerente;

/*Exibe o c�digo e o nome do departamento, sua m�dia salarial, mas somente para os departamentos que possuem o sal�rio m�nimo maior que R$ 1000.*/
SELECT d.DEPTNO, d.NOME, AVG(SALARIO) "M�dia Salarial"
FROM EMP e
JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
GROUP BY d.DEPTNO, d.NOME
HAVING AVG (SALARIO) > 1000;

/*Exibe o sal�rio, o c�digo e nome dos 3 empregados que possuem o menor sal�rio dentro da empresa. */
SELECT TOP 3 empno, nome, salario 
FROM EMP
ORDER BY salario;

/*Exibir os dois cargos que possuem maior m�dia salarial dentro da empresa.*/
SELECT TOP 2 cargo, salario
FROM EMP
GROUP BY cargo, salario
ORDER BY avg (salario) desc;
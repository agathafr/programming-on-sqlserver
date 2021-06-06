--Exerc�cios Trabalhando com SubConsultas

--Banco de dados EMPRESA

USE dbEmpresa

/*Exibe o c�digo e o nome dos empregados que possuem o mesmo cargo do empregado 7782.*/
SELECT empno, nome
FROM emp
WHERE cargo = 
(SELECT CARGO
FROM EMP
WHERE empno = 7782)

/*Exibir o c�digo e nome dos empregados que recebem mais que a m�dia salarial do departamento 20.*/
SELECT empno, nome
FROM emp
WHERE salario > 
(SELECT AVG(SALARIO)
FROM EMP
WHERE DEPTNO = 20)

/*Exibe o c�digo e nome dos empregados que trabalham em um departamento que possua algum empregado cujo nome possua a letra t*/	
SELECT empno, nome, deptno
FROM EMP 
WHERE deptno in
(SELECT deptno
FROM emp 
WHERE NOME like '%t%')

/*Exibe o nome dos empregados que n�o gerenciam nenhum outro empregado.*/
SELECT nome
FROM EMP e
WHERE NOT EXISTS
(SELECT * FROM EMP e2 WHERE e.empno = e2.gerente)

/*Exibir o nome dos departamentos que n�o possuem empregado.*/
SELECT NOME
FROM DEPT
WHERE NOT EXISTS 
(SELECT * FROM emp WHERE emp.DEPTNO = DEPT.DEPTNO)

/*Exibe os empregados que recebem mais que o sal�rio m�dio de seu departamento.*/
SELECT NOME, EMPNO, SUM(SALARIO) "Soma"
FROM EMP
WHERE salario >
(SELECT AVG(SALARIO)
FROM EMP
WHERE DEPTNO = DEPTNO)
GROUP BY nome, EMPNO

/*Exibe o nome do empregado, o seu sal�rio, e a diferen�a entre seu sal�rio e a m�dia salarial do departamento 10.*/
SELECT nome, salario, SALARIO - (SELECT AVG(salario) FROM EMP WHERE DEPTNO = 10) AS Difiren�a
FROM EMP



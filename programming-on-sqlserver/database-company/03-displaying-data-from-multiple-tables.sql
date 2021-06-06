--Banco de dados avançado
--Exercícios: Programando no SQL Server - Exibindo dados de várias tabelas

--Banco de dados Empresa
USE dbEmpresa

SELECT * 
FROM emp, dept

--Exibe o nome do empregado, seu cargo, salário, nome e local do departamento
SELECT e.nome nomeEMP, e.cargo cargoEMP, e.salario salarioEMP, d.nome nomeDEPT, d.loc locDEPT
FROM emp AS e, dept AS d;

--Exibe o cargo, nomes dos empregados e dos departamentos .
SELECT e.nome nomeEMP, e.cargo cargoEMP, d.nome nomeDEPT
FROM emp AS e, dept AS d -- a partir das tabelas emp e dept, dos empregados que 
WHERE salario > 2000 -- possuem salário acima de R$2000,00 e que
AND d.deptno in (20, 10) -- que trabalham nos depts 10 e 20 
ORDER BY d.nome, e.nome; -- (ordenação do resultado da consulta pelo nome do dept seguido pelo nome dos empregados.)

--Exibe o nome do departamento, seu local, o nome dos empregados vinculados aos departamentos
SELECT d.nome nomeDEPT, d.loc locDEPT, e.nome nomeEMP
FROM dept d
LEFT OUTER JOIN emp e --e os departamentos que não possuem empregados.
ON d.deptno = e.deptno;

--Exibe o nome do empregado, seu salário, e o nome do seu departamento. 
SELECT e.nome, e.salario, d.nome
FROM emp e
RIGHT OUTER JOIN dept d --Exibe inclusive empregados sem departamento
ON e.deptno = d.deptno;

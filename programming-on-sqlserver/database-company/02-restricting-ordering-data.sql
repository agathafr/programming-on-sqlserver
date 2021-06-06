/*Lista de Exercícios 
Restringindo e Ordenando Dados*/

/*Banco de dados Empresa*/

USE dbEmpresa

SELECT *
FROM emp

/* 1. Exibição do nome, cargo e salário dos empregados com salário acima de R$2000.00.*/
SELECT nome, cargo, salario
FROM emp
WHERE salario > 2000
ORDER BY cargo ASC, nome DESC; /*ordenação crescente do cargo e decrescente do nome*/

/* 2. Exibe o código do departamento e o nome dos empregados dos departamentos 10 e 20 que possuem o cargo balconista*/
SELECT deptno, nome
FROM emp
WHERE deptno in (10, 20) 
AND cargo = 'balconista'
/*Ordenação por ordem crescente primeiramente pelo número do departamento, e após, pelo nome do empregado.*/
ORDER BY deptno, nome ASC;

/* 3. Exibe o nome e cargo dos empregados com salário entre R$1000,00 e R$5000,00*/
SELECT nome, cargo
FROM emp
WHERE salario between 1000 and 5000
/*Ordenação crescente do salário*/
ORDER BY salario ASC;

/* 4. Exibe o código, nome e salário anual (gerada nova coluna) dos empregados que não possuem comissão*/
SELECT empno, nome, salario, salario * 12 AS "Salario Anual"
FROM emp
WHERE comissao is null
/*Resultado ordenado pelo salário anual*/
ORDER BY "Salario Anual";

/* 5. Exibe o nome, a comissão e o cargo dos empregados que começam com a letra A e que terminam com a letra S*/
SELECT nome, comissao, cargo 
FROM EMP
WHERE nome LIKE 'A' + '%S'
ORDER BY cargo, nome DESC;

/*Banco de dados Nutrição*/



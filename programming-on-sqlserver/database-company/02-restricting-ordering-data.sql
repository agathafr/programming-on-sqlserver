/*Lista de Exerc�cios 
Restringindo e Ordenando Dados*/

/*Banco de dados Empresa*/

USE dbEmpresa

SELECT *
FROM emp

/* 1. Exibi��o do nome, cargo e sal�rio dos empregados com sal�rio acima de R$2000.00.*/
SELECT nome, cargo, salario
FROM emp
WHERE salario > 2000
ORDER BY cargo ASC, nome DESC; /*ordena��o crescente do cargo e decrescente do nome*/

/* 2. Exibe o c�digo do departamento e o nome dos empregados dos departamentos 10 e 20 que possuem o cargo balconista*/
SELECT deptno, nome
FROM emp
WHERE deptno in (10, 20) 
AND cargo = 'balconista'
/*Ordena��o por ordem crescente primeiramente pelo n�mero do departamento, e ap�s, pelo nome do empregado.*/
ORDER BY deptno, nome ASC;

/* 3. Exibe o nome e cargo dos empregados com sal�rio entre R$1000,00 e R$5000,00*/
SELECT nome, cargo
FROM emp
WHERE salario between 1000 and 5000
/*Ordena��o crescente do sal�rio*/
ORDER BY salario ASC;

/* 4. Exibe o c�digo, nome e sal�rio anual (gerada nova coluna) dos empregados que n�o possuem comiss�o*/
SELECT empno, nome, salario, salario * 12 AS "Salario Anual"
FROM emp
WHERE comissao is null
/*Resultado ordenado pelo sal�rio anual*/
ORDER BY "Salario Anual";

/* 5. Exibe o nome, a comiss�o e o cargo dos empregados que come�am com a letra A e que terminam com a letra S*/
SELECT nome, comissao, cargo 
FROM EMP
WHERE nome LIKE 'A' + '%S'
ORDER BY cargo, nome DESC;

/*Banco de dados Nutri��o*/



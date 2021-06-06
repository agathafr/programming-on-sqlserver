--Banco de dados avan�ado
--Exerc�cios: Programando no SQL Server - Exibindo dados de v�rias tabelas

--Banco de dados Nutri��o

USE dbNutricao

SELECT *
FROM paciente, consulta, medico;

--Exibe nome e endere�o completo dos pacientes do sexo Feminino, nos estados RJ e MG, a data da sua consulta, o nome do m�dico que realizou a consulta,*/
SELECT p.nome nomePACIENTE, p.endereco, p.sexo, p.estado, c.datConsulta, m.nome nomeMEDICO
FROM paciente p, consulta c, medico m 
WHERE p.sexo = 'F' 
AND p.estado in ('RJ', 'MG');

SELECT * 
FROM alimento, categoriaAlimento, nutriente, composicaoAlimento, unidadeMedida;

/*Exibe o nome do alimento, o nome de sua categoria, e o nome, a quantidade e a unidade de medida dos nutrientes que o comp�e
Exibe somente alimentos cujo nome come�a com a letra a*/
SELECT a.nome nomeAlimento, c.nome categoriaAlimento, n.nome nomeNutriente, co.quantidade, u.nome unidadeMedida
FROM alimento a, categoriaAlimento c, nutriente n, unidadeMedida u, composicaoAlimento co
WHERE a.nome like 'A%';


SELECT *
FROM paciente, consulta, medico, dieta, categoriaDieta, composicaoDieta

SELECT *
FROM paciente 

SELECT *
FROM consulta

SELECT *
FROM  medico

SELECT * 
FROM avaliacaoNutricional 

SELECT *
FROM categoriaDieta 

SELECT *
FROM dieta 

SELECT *
FROM composicaoDieta

SELECT *
FROM alimento

/*Exibe o nome e endere�o completo do paciente, a data da consulta, o nome do m�dico que realizou a consulta, todos os dados das dietas realizadas na consulta (categoria e alimentos que comp�em as dietas)
Exibe o endere�o completo em um �nica coluna no padr�o Endere�o, Bairro � Cidade/Estado numa coluna de nome �Endere�o Completo�.*/

SELECT p.nome "Nome do paciente", p.endereco + ', ' + p.bairro + ' - ' + p.cidade + '/' + p.estado AS "Endere�o Completo", 
c.datConsulta "Data da Consulta", m.nome "Nome do m�dico", /*Exibe nome e endere�o completo do paciente, a data da consulta e o nome do m�dico que realizou a consulta*/
/*Exibe os dados da categoriaDieta*/
cd.idCategoriaDieta, cd.nome, cd.dataInclusao, 
/*Exibe os dados da dieta*/
d.idDieta, d.idConsulta, d.idCategoriaDieta, d.dataInclusao, 
/*Exibe os dados da composi��o da dieta*/
co.idComposicaoDieta, co.idDieta, co.idTipoRefeicao, co.idAlimento, co.quantidade, co.dataInclusao,
/*Exibe os dados dos alimentos que comp�e as dietas*/
al.idAlimento, al.nome, al.idCategoria, al.dataInclusao 

FROM paciente p
JOIN consulta c
ON p.idPaciente = c.idPaciente
JOIN medico m
ON m.idMedico = c.idMedico 
JOIN dieta d
ON d.idConsulta = c.idConsulta
JOIN categoriaDieta cd
ON d.idCategoriaDieta = cd.idCategoriaDieta
JOIN composicaoDieta co
ON co.idDieta = d.idDieta
JOIN alimento al
ON al.idAlimento = co.idAlimento;

/*Exibe o nome do paciente, seu endere�o, e o nome do m�dico que o consultou. Exibir todos os pacientes, mesmo os que nunca realizaram consultas.*/
SELECT p.nome "Nome do paciente", p.endereco, m.nome "Nome do m�dico"
FROM consulta c 
FULL OUTER JOIN paciente p
ON c.idPaciente = p.idPaciente
LEFT JOIN medico m
ON m.idMedico = c.idMedico

/*Exibir o nome do paciente, seu endere�o, a data da sua consulta, e todos os dados de suas avalia��es nutricionais. 
Exibe todos os pacientes, mesmo os que nunca realizaram consulta e que nunca realizaram avalia��o nutricional.*/

SELECT p.nome "Nome do paciente", p.endereco, c.datConsulta, /*Exibe o nome do paciente, seu endere�o, a data da sua consulta*/
avn.idAvaliacaoNutricional, avn.idConsulta, avn.peso, avn.altura, avn.percGordura, avn.dataInclusao /*Exibe os dados da avalia��o nutricional*/
FROM consulta c 
FULL OUTER JOIN paciente p
ON c.idPaciente = p.idPaciente
LEFT JOIN avaliacaoNutricional avn
ON avn.idConsulta = c.idConsulta

/*Desafio (banco de dados Empresa)*/

USE dbEmpresa

SELECT * 
FROM emp

SELECT * 
FROM dept

SELECT * 
FROM SALGRADE

/*Criar uma consulta para exibir o nome do empregado, seu sal�rio, bem como o nome e sal�rio do seu gerente.*/
SELECT e.nome AS "Nome dos empregados", e.salario AS "Sal�rio dos empregados", g.nome AS "Nome do gerente", g.salario AS "Sal�rio do gerente"
FROM emp e
INNER JOIN emp g
ON e.GERENTE = g.EMPNO

/*O nome do empregado, seu sal�rio, e o n�vel salarial no qual o mesmo se encontra, de acordo com a tabela SALGRADE*/
SELECT e.nome, e.salario, sal.GRAU 
FROM emp e
INNER JOIN salgrade sal
ON salario >= salminimo and salario < salmaximo


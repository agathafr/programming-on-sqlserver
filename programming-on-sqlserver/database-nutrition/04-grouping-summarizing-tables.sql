/*Banco de dados Nutrição*/

USE dbNutricao

SELECT * FROM alimento

/*Quantos pacientes moram em São Paulo ou no Rio de Janeiro?*/
SELECT COUNT(cidade)
FROM paciente
WHERE cidade in ('São Paulo', 'Rio de Janeiro')

/*Exibe o nome da cidade, o estado e a quantidade de pacientes por cidade/estado.*/
SELECT cidade, estado, COUNT(idpaciente) "Quantidade de pacientes"
FROM paciente
GROUP BY cidade, estado;

/*Exibe o nome do paciente, a data de sua primeira e da sua última consulta.*/
SELECT p.nome, MIN(datConsulta) "Data da primeira consulta", MAX(datConsulta) "Data da última consulta"
FROM paciente p
JOIN consulta c
ON p.idPaciente = c.idPaciente
GROUP BY nome, datConsulta;

/*Exibe a quantidade de consultas realizadas por cidade e estado*/
SELECT estado, cidade, COUNT (idConsulta) "Quantidade de consultas por cidade/estado"
FROM consulta c
JOIN paciente p
ON c.idPaciente = p.idPaciente
GROUP BY cidade, estado;

/*Para cada dieta, exibir o nome do paciente, a data em que foi realizada, e a quantidade total de cada nutriente que compõe a dieta.*/
SELECT p.nome, c.datConsulta, co.quantidade, SUM(ca.quantidade) "Total Nutrientes"
FROM consulta c
JOIN paciente p
ON c.idPaciente = p.idPaciente
JOIN dieta d
ON d.idConsulta = c.idConsulta
JOIN composicaoDieta co
ON co.idDieta = d.idDieta
JOIN alimento al
ON al.idAlimento = co.idAlimento
JOIN composicaoAlimento ca
ON ca.idAlimento = al.idAlimento
GROUP BY p.nome, c.datConsulta, co.quantidade;
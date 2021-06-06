--Exerc�cios Trabalhando com SubConsultas

/*Banco de dados Nutri��o*/

USE dbNutricao

/*Exibe o c�digo e nome dos pacientes que moram no mesmo estado do paciente de c�digo 170.*/
SELECT idPaciente, nome
FROM paciente
WHERE estado =
(SELECT estado
FROM paciente WHERE idPaciente =  170)

/*Exibe o c�digo e nome dos pacientes que nunca realizaram uma consulta.*/
SELECT idPaciente, nome
FROM paciente p
WHERE NOT EXISTS (SELECT * FROM consulta c WHERE p.idPaciente = c.idPaciente)
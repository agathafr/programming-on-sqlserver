/*Exerc�cios
Fun��es que retornam tabelas*/

/*Banco de Dados dbNutricao*/
USE dbNutricao

-- Cria uma fun��o que receba o c�digo de um paciente, e que
CREATE FUNCTION ft_paciente_DadosAvn (@idPaciente int)
returns table 
as 
return --retorna
select p.nome "Nome", c.datConsulta "Data das avalia��es nutricionais realizadas", avn.peso "Peso" --o nome do paciente, as datas avalia��es nutricionais, e o peso dele na avalia��o
from paciente p
join consulta c
on p.idPaciente = c.idPaciente
join avaliacaoNutricional avn
on c.idConsulta = avn.idConsulta
WHERE p.idPaciente = @idPaciente
GO

select *
from ft_paciente_DadosAvn(120) 

-- Cria uma fun��o que receba o c�digo de um paciente, e que
CREATE FUNCTION ft_cidade_estado_iguais (@idPaciente int)
RETURNS TABLE 
AS 
RETURN
SELECT nome, sexo, dataNascimento -- retorna o nome, sexo e a data de nascimento dos pacientes 
FROM paciente
WHERE idpaciente <> @idPaciente and estado = --(cujo id � diferente do id passado como par�metro) que moram no mesmo estado 
(SELECT estado
FROM paciente WHERE idPaciente =  @idPaciente) --do paciente recebido como par�metro
AND cidade = --e na mesma cidade
(SELECT cidade
FROM paciente
WHERE idPaciente = @idPaciente) --do paciente recebido como par�metro
GO

select *
from ft_cidade_estado_iguais(120)


/*Exerc�cios -
Fun��es Escalares*/
/*Banco de Dados dbNutricao*/
USE dbNutricao

--Cria uma fun��o que recebe como par�metro o id do paciente
CREATE FUNCTION ft_Exibe_Endereco (@idPaciente int)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @exibeEndereco varchar(100)

	SELECT @exibeEndereco = endereco + ' - ' + bairro + ', ' + cidade + '/' + estado
	FROM paciente
	WHERE idPaciente = @idPaciente

	return @exibeEndereco --retorna o endere�o formatado
END

SELECT dbo.ft_Exibe_Endereco (idPaciente) as "Endere�o Formatado"
FROM paciente

--Cria uma fun��o que recebe como par�metro o id do paciente 
CREATE FUNCTION ft_Media_Peso (@idPaciente int)
RETURNS numeric (4,2)
AS
BEGIN
	DECLARE @mediaPeso numeric (4,2)

	SELECT @mediaPeso = AVG (Peso)
	FROM avaliacaoNutricional avn
	JOIN consulta c
	ON avn.idConsulta = c.idConsulta
	WHERE idPaciente = @idPaciente

	return @mediaPeso -- retorna a m�dia de peso considerando todas as avalia��es nutricionais realizadas
END

SELECT dbo.ft_Media_Peso (idPaciente) as "M�dia do Peso"
FROM paciente

--Cria uma fun��o que receba como par�metro o id do paciente
ALTER FUNCTION ft_IMC (@idPaciente int)
returns numeric (4,2)
AS
BEGIN
	DECLARE @imc numeric (4,2)

	SELECT @imc = peso/(altura * altura)
	FROM avaliacaoNutricional avn
	JOIN consulta c
	ON avn.idConsulta = c.idConsulta
	WHERE c.idPaciente = @idPaciente -- recupera todas as consultas do paciente
	AND datConsulta = -- retorna a data da consulta do paciente 
	(SELECT MAX(datConsulta)
	FROM paciente p
	JOIN consulta c
	ON p.idPaciente = c.idPaciente
	JOIN avaliacaoNutricional avn
	ON c.idConsulta = avn.idConsulta
	WHERE C.idPaciente = @idPaciente)  
	
	return @imc --retorna o imc na �ltima avalia��o nutricional.
END

SELECT nome, dbo.ft_IMC (idPaciente) as "IMC da �ltima avalia��o nutricional"
FROM paciente

-- Cria uma fun��o que recebe como par�metro o id do paciente
CREATE FUNCTION ft_classificacaoIMC (@idPaciente int)
returns VARCHAR (100)
AS
BEGIN
	DECLARE @IMC numeric(10,2)
	,       @classificacaoIMC VARCHAR (100)
	
	SET @IMC = dbo.ft_IMC(@idPaciente)  
	
	IF @IMC < 18.5
	SET @classificacaoIMC = 'Abaixo do peso'
	ELSE
	IF @IMC between 18.5 and 24.9
	SET @classificacaoIMC = 'Peso Normal'
	ELSE
	IF @IMC between 24.9 and 29.9
	SET @classificacaoIMC = 'Sobrepeso'
	ELSE 
	IF @IMC between 29.9 and 34.9
	SET @classificacaoIMC = 'Obesidade grau 1'
	ELSE 
	IF @IMC between 34.9 and 39.9
	SET @classificacaoIMC = 'Obesidade grau 2'
	ELSE 
	IF @IMC >= 40
	SET @classificacaoIMC = 'Obesidade m�rbida'

	return @classificacaoIMC --retorna a classifica��o do IMC na �ltima avalia��o nutricional.
END

SELECT nome, dbo.ft_classificacaoIMC (idPaciente) as "Classifica��o do IMC da �ltima avalia��o nutricional"
FROM paciente

--Cria uma fun��o INIT_CAP, que recebe uma string e que a retorne com as iniciais  mai�sculas, e as demais letras, em min�scula.
ALTER FUNCTION ft_INIT_CAP (@string VARCHAR(100))
returns VARCHAR(100)
AS
BEGIN
	declare @nomeFormatado VARCHAR(100)
			
	set  @nomeFormatado = LEFT(@string, 1) + RIGHT (LOWER (@string), LEN(@string)-1) -- falta consertar 

	return @nomeFormatado

END

SELECT dbo.ft_INIT_CAP('ALEXANDRE SIQUEIRA DIAS') as INIT_CAP
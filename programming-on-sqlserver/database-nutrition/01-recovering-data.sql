/*Banco de dados dbNutricao*/
USE dbNutricao

SELECT * 
FROM dbo.paciente;

/*Exibi��o da cidade, estado e nome do paciente.*/
SELECT nome, cidade, estado
FROM dbo.paciente
/*Resultado exibido com o estado em ordem crescente e com a cidade em ordem crescente (ap�s a ordena��o por estado).*/
ORDER BY estado, cidade ASC;

/*Exibi��o do nome e sexo do paciente e da cidade em que ele est� concatenada com o estado (separados por /) numa nova coluna nomeada "Cidade".*/
SELECT nome, sexo, cidade + '/' + estado 
AS Cidade
FROM dbo.paciente;
		
/*Sele��o da cidade, estado do paciente eliminando linhas duplicadas.*/
SELECT DISTINCT cidade, estado
FROM dbo.paciente
/*Resultado exibido com a ordena��o crescente do estado, e ap�s, da cidade.*/
ORDER BY estado, cidade ASC;
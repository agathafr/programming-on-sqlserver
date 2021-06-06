/*Banco de dados dbNutricao*/
USE dbNutricao

SELECT * 
FROM dbo.paciente;

/*Exibição da cidade, estado e nome do paciente.*/
SELECT nome, cidade, estado
FROM dbo.paciente
/*Resultado exibido com o estado em ordem crescente e com a cidade em ordem crescente (após a ordenação por estado).*/
ORDER BY estado, cidade ASC;

/*Exibição do nome e sexo do paciente e da cidade em que ele está concatenada com o estado (separados por /) numa nova coluna nomeada "Cidade".*/
SELECT nome, sexo, cidade + '/' + estado 
AS Cidade
FROM dbo.paciente;
		
/*Seleção da cidade, estado do paciente eliminando linhas duplicadas.*/
SELECT DISTINCT cidade, estado
FROM dbo.paciente
/*Resultado exibido com a ordenação crescente do estado, e após, da cidade.*/
ORDER BY estado, cidade ASC;
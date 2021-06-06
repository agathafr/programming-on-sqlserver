-- Exercícios Criando views

-- Banco de dados Nutrição
USE dbNutricao
GO

/*Cria uma view que exibe o nome do alimento, o nome de sua categoria, e o nome, quantidade e unidade de medida dos nutrientes que o compõem.*/
USE dbNutricao
GO
CREATE VIEW V_NUT (aNOME, caNOME, nNOME, coaQUANTIDADE, uNOME)
AS
SELECT a.nome AS Nome_Alimento, ca.nome AS Nome_Categoria_Alimento, n.nome AS Nome_Nutriente, coa.quantidade, u.Nome AS Nome_Unidade_Medida
FROM unidadeMedida u, categoriaAlimento ca
JOIN alimento a
ON ca.idCategoria = a.idCategoria
JOIN composicaoAlimento coa
ON coa.idAlimento = a.idAlimento
JOIN nutriente n
ON n.idNutriente = coa.idNutriente
GO

/*Exibe somente os alimentos da categoria Bebidas (alcoólicas e não alcoólicas) através da view V_NUT.*/
SELECT aNOME, caNOME
FROM V_NUT
WHERE caNOME = 'Bebidas (alcoólicas e não alcoólicas)'

/*Cria uma view que exibe o identificador, nome e endereço do paciente, o identificador e a data da sua consulta, e o nome do médico que realizou a consulta.*/  
USE dbNutricao
GO
CREATE VIEW V_Paciente (Id_Paciente, Nome_Paciente, Endereco_Paciente, Id_consulta, Data_Consulta, Nome_Medico)
AS
SELECT p.idpaciente, p.nome, p.endereco, c.idConsulta, c.datConsulta, m.nome 
FROM consulta c 
JOIN paciente p
ON c.idPaciente = p.idPaciente
JOIN medico m
ON m.idMedico = c.idMedico
GO

/*Cria uma view que exibe o nome e endereço do paciente, a data da sua consulta, o médico que realizou a consulta, 
bem como todos os dados das dietas realizadas na consulta (categoria e alimentos que compõem as dietas)*/

CREATE VIEW vw_Dietas_Pacientes (nomePaciente, enderecoPaciente, dataConsulta, nomeMedico, idCategoriaDieta, nomeCategoriaDieta,
dataInclusao_categoriaDieta, idDieta, idConsulta, id_CategoriaDieta, dataInclusao_dieta, idComposicaoDieta, id_Dieta, idTipoRefeicao,
idAlimento, quantidadeNutrientes, dataInclusao_composicaoDieta, id_Alimento, nomeAlimento, idCategoria, dataInclusao_alimento)
AS
SELECT p.nome, p.endereco, c.datConsulta, m.nome, cd.idCategoriaDieta, cd.nome, cd.dataInclusao, d.idDieta, d.idConsulta, d.idCategoriaDieta, 
d.dataInclusao, co.idComposicaoDieta, co.idDieta, co.idTipoRefeicao, co.idAlimento, co.quantidade, co.dataInclusao, al.idAlimento, 
al.nome, al.idCategoria, al.dataInclusao
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
GO

/*Cria uma view que exibe o nome e endereço do paciente, a data da sua consulta, o médico que realizou a consulta, 
bem como todos os dados das avaliações nutricionais realizadas nas consultas.*/ 

CREATE VIEW vw_avaNutri (nomePaciente, enderecoPaciente, dataConsulta, nomeMedico, 
idAvaliacaoNutricional, idConsulta, peso, altura, percGordura, dataInclusao)
AS
SELECT p.nome, p.endereco, c.datConsulta, m.nome, 
avn.idAvaliacaoNutricional, avn.idConsulta, avn.peso, avn.altura, avn.percGordura, avn.dataInclusao
FROM paciente p
JOIN consulta c
ON p.idPaciente = c.idPaciente
JOIN medico m
ON m.idMedico = c.idMedico 
JOIN avaliacaoNutricional avn
ON avn.idConsulta = c.idConsulta
GO

/*Através da view criada, exiba todas as avaliações nutricionais dos pacientes que possuem mais de 40 anos 
(utilizando como base a data atual do servidor) */

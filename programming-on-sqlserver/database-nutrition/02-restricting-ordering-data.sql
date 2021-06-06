USE dbNutricao

SELECT *
FROM dbo.paciente;

/* 1. Exibe o nome do paciente, cidade e estado dos pacientes que possuem Silva no nome*/
SELECT nome, cidade, estado
FROM dbo.paciente
WHERE nome like '%Silva%'
ORDER BY nome DESC;

/* 2. Exibe nome, endereço, bairro, cidade e o estado dos pacientes do RJ e SP */
SELECT nome, endereco, bairro, cidade, estado
FROM paciente
WHERE estado in ('RJ', 'SP')
ORDER BY estado, cidade DESC;

/* 3. Exibe nome, cidade, endereço dos pacientes de MG*/
SELECT nome, cidade, endereco, estado
FROM paciente
WHERE estado = 'MG'
ORDER BY cidade, nome ASC;

/* 4. Exibe nome e data de nascimento dos pacientes que moram no centro da cidade de Belo Horizonte, MG*/
SELECT nome, dataNascimento
FROM paciente
WHERE bairro = 'Centro' and cidade = 'Belo Horizonte' and estado = 'MG';

SELECT *
FROM alimento

/* 5. Exibe o nome dos alimentos que começam com a palavra "Arroz"*/
SELECT nome
FROM alimento
WHERE nome like 'arroz%'

/* 6. Exibe o nome dos alimentos que possuem palavra a palavra "congelado em qualquer parte do nome"*/
SELECT nome
FROM alimento
WHERE nome like '%congelado%'
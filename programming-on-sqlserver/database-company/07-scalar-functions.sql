/*Exercícios -
Funções Escalares*/

/*Banco de Dados dbEmpresa*/
USE dbEmpresa

--Cria uma função que recebe como parâmetro o código (empno) de um empregado
CREATE FUNCTION ft_Gerente_Empregado (@EMPNO INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @nome_gerente VARCHAR(100)
	
	SELECT @nome_gerente = g.NOME -- atribui os nomes da coluna "nome" da tabela emp a variável @nome_gerente
	FROM emp f -- emp f representa todos os funcionários
	JOIN emp g -- self join na tabela emp g que tem o nome e código do gerente para buscar o nome dele
	ON f.gerente = g.empno  -- a condição de junção é a coluna gerente da tabela onde estão os funcionários ser igual a coluna empno da tabela onde estão os dados do gerente
	WHERE f.empno = @EMPNO  -- quando o código do funcionário for igual ao do funcionário que está sendo passado como parâmetro, a cláusula select é executada (mostra o nome do gerente dele)
	
	IF @nome_gerente is null -- caso o empregado não possua gerente,
	SET @nome_gerente = '(sem gerente)'-- retorna “(sem gerente)”.

	RETURN @nome_gerente -- retorna o nome do gerente. 
END

SELECT dbo.ft_Gerente_Empregado (EMPNO) AS "Nome dos Gerentes e Empregados Não Gerenciados"
FROM EMP

--Cria uma função que recebe o código do empregado 
CREATE FUNCTION ft_Media_Salarial_Dpt (@EMPNO int)
RETURNS numeric (10,2)
AS
BEGIN	
	DECLARE @mediaSalarial numeric(10,2)
	,		@deptno int

	SELECT @deptno = deptno -- atribui o departamento a variável @deptno
	FROM emp
	WHERE EMPNO = @EMPNO -- quando o código do empregado for igual ao que estiver sendo passado como parâmetro faz a atribuição da clásula select 

	SELECT @mediaSalarial = AVG(SALARIO) -- calcula a média salarial e atribui a variável @mediaSalarial
	FROM emp	
	WHERE deptno = @deptno -- quando o código do departamento for igual ao armazenado na variável @deptno (no momento da execução) faz o cálculo da média salarial da cláusula select e atribui a variável @mediaSalarial	

	return @mediaSalarial -- retorna a média salarial de seu departamento.
END

SELECT dbo.ft_Media_Salarial_Dpt (EMPNO) as "Média Salarial"
FROM EMP

--Cria uma função que recebe o código de um empregado 
CREATE FUNCTION ft_Nivel_Salarial (@EMPNO int)
RETURNS int
AS
BEGIN
	DECLARE @nivelSalarial int

	SELECT @nivelSalarial = sal.grau -- atribui o grau a variável @nivelSalarial
	FROM emp e
	INNER JOIN salgrade sal
	ON salario >= salminimo and salario < salmaximo -- condição de junção: o salário do empregado ser maior ou igual ao salário mínimo, e menor que o salário máximo 
	WHERE EMPNO = @EMPNO -- compara o empno passado como parâmtro ao empno da tabela emp e retorna o grau salarial do empregrado em questão baseado na lógica da condição de junção

	return @nivelSalarial -- retorna o nível salarial
END	

SELECT nome, dbo.ft_Nivel_Salarial (EMPNO) as "Nível Salarial"
FROM EMP


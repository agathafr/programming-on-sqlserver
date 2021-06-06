/*Exerc�cios -
Fun��es Escalares*/

/*Banco de Dados dbEmpresa*/
USE dbEmpresa

--Cria uma fun��o que recebe como par�metro o c�digo (empno) de um empregado
CREATE FUNCTION ft_Gerente_Empregado (@EMPNO INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @nome_gerente VARCHAR(100)
	
	SELECT @nome_gerente = g.NOME -- atribui os nomes da coluna "nome" da tabela emp a vari�vel @nome_gerente
	FROM emp f -- emp f representa todos os funcion�rios
	JOIN emp g -- self join na tabela emp g que tem o nome e c�digo do gerente para buscar o nome dele
	ON f.gerente = g.empno  -- a condi��o de jun��o � a coluna gerente da tabela onde est�o os funcion�rios ser igual a coluna empno da tabela onde est�o os dados do gerente
	WHERE f.empno = @EMPNO  -- quando o c�digo do funcion�rio for igual ao do funcion�rio que est� sendo passado como par�metro, a cl�usula select � executada (mostra o nome do gerente dele)
	
	IF @nome_gerente is null -- caso o empregado n�o possua gerente,
	SET @nome_gerente = '(sem gerente)'-- retorna �(sem gerente)�.

	RETURN @nome_gerente -- retorna o nome do gerente. 
END

SELECT dbo.ft_Gerente_Empregado (EMPNO) AS "Nome dos Gerentes e Empregados N�o Gerenciados"
FROM EMP

--Cria uma fun��o que recebe o c�digo do empregado 
CREATE FUNCTION ft_Media_Salarial_Dpt (@EMPNO int)
RETURNS numeric (10,2)
AS
BEGIN	
	DECLARE @mediaSalarial numeric(10,2)
	,		@deptno int

	SELECT @deptno = deptno -- atribui o departamento a vari�vel @deptno
	FROM emp
	WHERE EMPNO = @EMPNO -- quando o c�digo do empregado for igual ao que estiver sendo passado como par�metro faz a atribui��o da cl�sula select 

	SELECT @mediaSalarial = AVG(SALARIO) -- calcula a m�dia salarial e atribui a vari�vel @mediaSalarial
	FROM emp	
	WHERE deptno = @deptno -- quando o c�digo do departamento for igual ao armazenado na vari�vel @deptno (no momento da execu��o) faz o c�lculo da m�dia salarial da cl�usula select e atribui a vari�vel @mediaSalarial	

	return @mediaSalarial -- retorna a m�dia salarial de seu departamento.
END

SELECT dbo.ft_Media_Salarial_Dpt (EMPNO) as "M�dia Salarial"
FROM EMP

--Cria uma fun��o que recebe o c�digo de um empregado 
CREATE FUNCTION ft_Nivel_Salarial (@EMPNO int)
RETURNS int
AS
BEGIN
	DECLARE @nivelSalarial int

	SELECT @nivelSalarial = sal.grau -- atribui o grau a vari�vel @nivelSalarial
	FROM emp e
	INNER JOIN salgrade sal
	ON salario >= salminimo and salario < salmaximo -- condi��o de jun��o: o sal�rio do empregado ser maior ou igual ao sal�rio m�nimo, e menor que o sal�rio m�ximo 
	WHERE EMPNO = @EMPNO -- compara o empno passado como par�mtro ao empno da tabela emp e retorna o grau salarial do empregrado em quest�o baseado na l�gica da condi��o de jun��o

	return @nivelSalarial -- retorna o n�vel salarial
END	

SELECT nome, dbo.ft_Nivel_Salarial (EMPNO) as "N�vel Salarial"
FROM EMP


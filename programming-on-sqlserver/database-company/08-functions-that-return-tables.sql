/*Exerc�cios
Fun��es que retornam tabelas*/

/*Banco de Dados dbEmpresa*/
USE dbEmpresa

-- Cria uma fun��o que recebe como argumento o c�digo de um departamento, e que 
CREATE FUNCTION ft_dept_Dados_Funcionarios (@deptno int)
RETURNS TABLE
AS
RETURN -- retorna
SELECT d.nome as "nome do departamento", e.nome, e.cargo, e.salario -- o nome do departamento e o nome, cargo e sal�rio de todos os empregados.
FROM emp e join dept d 
ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = @deptno -- quando o c�digo do departamento for igual ao que estiver sendo passado como par�metro
GO

select *
from ft_dept_Dados_Funcionarios(20)

-- Cria uma fun��o que recebe como primeiro argumento o c�digo de um departamento e como segundo argumento um inteiro, e que
 CREATE FUNCTION ft_media_Salarial(
	@deptno int, 
	@opcao int
)
 returns @empregados table ( --retorna 
	  codigo int			 --o c�digo
,	  nome varchar(50)       --o nome    
,	  cargo varchar(50)		 --o cargo dos empregados 
) 
 AS
 BEGIN
	declare @media money

	select @media = avg(salario)
	from   emp
	where  deptno = @deptno

	if (@opcao = 1) --se a op��o for = 1
		insert into @empregados
		select empno, nome, cargo
		from emp 
		where deptno = @deptno
		and salario > @media --com sal�rio acima da m�dia do departamento
	else if (@opcao = 2) --se a op��o for = 2
		insert into @empregados
		select empno, nome, cargo
		from emp 
		where deptno = @deptno
		and salario < @media --com sal�rio abaixo da m�dia do departamento
	return
END
GO
select *
from ft_media_Salarial(20,1)


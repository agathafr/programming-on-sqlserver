/*Exercícios
Funções que retornam tabelas*/

/*Banco de Dados dbEmpresa*/
USE dbEmpresa

-- Cria uma função que recebe como argumento o código de um departamento, e que 
CREATE FUNCTION ft_dept_Dados_Funcionarios (@deptno int)
RETURNS TABLE
AS
RETURN -- retorna
SELECT d.nome as "nome do departamento", e.nome, e.cargo, e.salario -- o nome do departamento e o nome, cargo e salário de todos os empregados.
FROM emp e join dept d 
ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = @deptno -- quando o código do departamento for igual ao que estiver sendo passado como parâmetro
GO

select *
from ft_dept_Dados_Funcionarios(20)

-- Cria uma função que recebe como primeiro argumento o código de um departamento e como segundo argumento um inteiro, e que
 CREATE FUNCTION ft_media_Salarial(
	@deptno int, 
	@opcao int
)
 returns @empregados table ( --retorna 
	  codigo int			 --o código
,	  nome varchar(50)       --o nome    
,	  cargo varchar(50)		 --o cargo dos empregados 
) 
 AS
 BEGIN
	declare @media money

	select @media = avg(salario)
	from   emp
	where  deptno = @deptno

	if (@opcao = 1) --se a opção for = 1
		insert into @empregados
		select empno, nome, cargo
		from emp 
		where deptno = @deptno
		and salario > @media --com salário acima da média do departamento
	else if (@opcao = 2) --se a opção for = 2
		insert into @empregados
		select empno, nome, cargo
		from emp 
		where deptno = @deptno
		and salario < @media --com salário abaixo da média do departamento
	return
END
GO
select *
from ft_media_Salarial(20,1)


/*Relatório 1 - Lista dos empregados admitidos entre 2019-01-01 e 2022-03-31, 
 trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Departamento, Número de Telefone), 
 ordenado por data de admissão decrescente;*/

select empregado.nome "Nome", empregado.cpf "CPF", date_format(empregado.dataAdm, "%d/%m/%Y") "Data Admissão",
 concat("R$ ", format(empregado.salario, 2, "de_DE")) "Salário", departamento.nome "Departamento", coalesce(telefone.numero, "Não Informado") "Telefone"
from empregado
inner join Departamento on empregado.Departamento_idDepartamento = departamento.idDepartamento
left join Telefone on empregado.cpf = telefone.Empregado_cpf
where empregado.dataAdm between '2019-01-01' and '2022-03-31'
order by empregado.dataAdm desc;

/*Relatório 2 - Lista dos empregados que ganham menos que a média salarial dos funcionários do Petshop, trazendo as colunas 
 (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Departamento, Número de Telefone), ordenado por nome do empregado;*/
 
 /*SELECT emp.nome "Nome Empregado", emp.cpf "CPF Empregado", 
       DATE_FORMAT(emp.dataAdm, "%d/%m/%Y") "Data Admissão", 
       CONCAT("R$ ", FORMAT(emp.salario, 2, "de_DE")) "Salário", 
       dep.nome "Departamento", 
       COALESCE(tel.numero, "Não Informado") "Número de Telefone"
FROM empregado emp
INNER JOIN departamento dep ON emp.Departamento_idDepartamento = dep.idDepartamento
LEFT JOIN telefone tel ON emp.cpf = tel.Empregado_cpf
WHERE emp.salario < (SELECT AVG(salario) FROM empregado)
ORDER BY emp.nome;*/
 
 select emp.nome "Empregado", emp.CPF "CPF",  date_format(emp.dataAdm, "%H:%i %d/%m/%Y") "Data de Admissão",  concat("R$ ", format (emp.salario, 2, "de_DE")) "Salário",
 dep.nome "Nome do Departamento", Departamento_idDepartamento "Id do Departamenento"
	from empregado emp
		inner join departamento dep on dep.idDepartamento = emp.Departamento_idDepartamento
        where salario < (select avg(salario) from empregado)
        order by emp.nome;

/*Relatório 3 - Lista dos departamentos com a quantidade de empregados total por cada departamento, trazendo também a média salarial dos 
funcionários do departamento e a média de comissão recebida pelos empregados do departamento, com as colunas 
(Departamento, Quantidade de Empregados, Média Salarial, Média da Comissão), ordenado por nome do departamento;*/

select dep.nome "Nome do Departamento", dep.idDepartamento "ID do Departamento", 
count(emp.cpf) "Quantidade de Funcionários", 
concat("R$ ", format (avg(emp.salario), 2, "de_DE")) "Média Salarial",
concat("R$ ", format (avg(emp.comissao), 2, "de_DE")) "Média Comissional"
	from departamento dep
		left join empregado emp on dep.idDepartamento = emp.Departamento_idDepartamento
		group by dep.nome, dep.idDepartamento
			order by dep.nome;

/*Relatório 4 - Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado, além da soma do valor total das vendas do 
empregado e a soma de suas comissões, trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido, 
Total Comissão das Vendas), ordenado por quantidade total de vendas realizadas;*/

select emp.nome "Empregado", emp.CPF "CPF", concat("R$", format (emp.salario, 2, "de_DE")) "Salário",
 concat("R$ ", format (sum(vnd.comissao), 2, "de_DE")) "Total Valor Comissão",
 concat("R$ ", format (sum(vnd.valor), 2, "de_DE")) "Total Valor Vendido",
 count(vnd.idVenda) "Quantidade de Vendas"
	from empregado emp
		inner join venda vnd ON vnd.Empregado_cpf = emp.CPF
		group by emp.nome, emp.CPF, emp.sexo, emp.salario
			order by count(vnd.idVenda) desc;

/*Relatório 5 - Lista dos empregados que prestaram Serviço na venda computando a quantidade total de vendas realizadas com serviço por cada 
Empregado, além da soma do valor total apurado pelos serviços prestados nas vendas por empregado e a soma de suas comissões, 
trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas com Serviço, Total Valor Vendido com Serviço, 
Total Comissão das Vendas com Serviço), ordenado por quantidade total de vendas realizadas;*/

select emp.nome "Empregado", emp.CPF "CPF", 
concat("R$ ", format (emp.salario, 2, "de_DE")) "Salário",
count(vnd.idVenda)"Quantidade Vendas com Serviço",
concat("R$ ", format (sum(vnd.valor), 2, "de_DE")) "Total Valor Vendido com Serviço",
concat("R$ ", format (sum(vnd.comissao), 2, "de_DE")) "Total Comissão das Vendas com Serviço"
	from empregado emp
		inner join itensservico its on its.Empregado_cpf = emp.cpf
        inner join servico svc on its.Servico_idServico = svc.idServico
        inner join venda vnd on its.venda_idvenda = vnd.idvenda
			group by emp.nome, emp.cpf, emp.salario 
				order by count(vnd.idVenda) desc;

/*Relatório 6 - Lista dos serviços já realizados por um Pet, trazendo as colunas (Nome do Pet, Data do Serviço, Nome do Serviço, Quantidade, Valor, 
Empregado que realizou o Serviço), ordenado por data do serviço da mais recente a mais antiga;*/

select pet.nome "Nome do Pet", date_format(vnd.data, "%H:%i %d/%m/%Y") "Data do Serviço", svc.nome "Nome do Serviço", 
count(svc.idServico) "Quantidade",
emp.nome" Empregado que realizou o Serviço"
	from pet pet
		inner join itensservico its on its.PET_idPET = pet.idPET
        inner join servico svc on its.Servico_idServico = svc.idServico
        inner join empregado emp on its.Empregado_cpf = emp.cpf
        inner join venda vnd on its.venda_idvenda = vnd.idvenda	
			group by pet.nome, vnd.data, svc.nome, emp.nome
				order by vnd.data;

/*Relatório 7 - Lista das vendas já realizados para um Cliente, trazendo as colunas (Data da Venda, Valor, Desconto, Valor Final, 
Empregado que realizou a venda), ordenado por data do serviço da mais recente a mais antiga;*/

select cli.nome "Cliente", date_format(vnd.data, "%H:%i %d/%m/%Y") "Data da Venda",
concat("R$ ", format(vnd.valor, 2, "de_DE")) "Valor",
concat("R$ ", format(vnd.desconto, 2, "de_DE")) "Desconto",
concat("R$ ", format(vnd.valor - vnd.desconto, 2, "de_DE")) "Valor Total",
emp.nome "Empregado que realizou a venda"
	from cliente cli
		inner join venda vnd on vnd.Cliente_cpf = cli.cpf
        inner join empregado emp on vnd.Empregado_cpf = emp.cpf;

/*Relatório 8 - Lista dos 10 serviços mais vendidos, trazendo a quantidade vendas cada serviço, o somatório total dos valores de serviço vendido, 
trazendo as colunas (Nome do Serviço, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;*/

select svc.nome "Nome do Serviço", count(vnd.idVenda) "Quantidade de Venda", 
concat("R$ ", format (sum(svc.valorvenda), 2, "de_DE")) "Total Valor Vendido"
	from servico svc
    inner join itensservico its on its.Servico_idServico = svc.idServico
	inner join venda vnd on its.venda_idvenda = vnd.idvenda
		group by svc.nome
			order by count(vnd.idVenda)
				limit 10

/*Relatório 9 - Lista das formas de pagamentos mais utilizadas nas Vendas, informando quantas vendas cada forma de pagamento já foi relacionada, 
trazendo as colunas (Tipo Forma Pagamento, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;*/

select fpv.tipo "Tipo da Forma Pagamento", count(fpv.idFormaPgVenda) "Quantidade das Vendas",
concat("R$ ", format(sum(vnd.valor), 2, "de_DE")) "Total do Valor Vendido"
	from venda vnd
		inner join formapgvenda fpv on fpv.Venda_idVenda = vnd.idVenda
			group by fpv.tipo
				order by count(fpv.idFormaPgVenda) desc;

/*Relatório 10 - Balaço das Vendas, informando a soma dos valores vendidos por dia, trazendo as colunas (Data Venda, Quantidade de Vendas, 
Valor Total Venda), ordenado por Data Venda da mais recente a mais antiga;*/

select date_format(vnd.data, "%H:%i %d/%m/%Y") "Data de Venda", count(vnd.data) "Quantidade de Vendas",
concat("R$ ", format(sum(vnd.valor - vnd.desconto), 2, "de_DE")) "Valor Total Venda"
	from venda vnd
		group by vnd.idVenda
			order by vnd.data;

/*Relatório 11 - Lista dos Produtos, informando qual Fornecedor de cada produto, trazendo as colunas (Nome Produto, Valor Produto, 
Categoria do Produto, Nome Fornecedor, Email Fornecedor, Telefone Fornecedor), ordenado por Nome Produto;*/

select distinct prod.nome "Nome do Produto", coalesce(forn.nome, "Não informado") "Fornecedor", 
concat("R$ ", format(prod.precoCusto, 2, "de_DE")) "Valor do Produto", prod.idProduto "Id do Produto", 
coalesce(forn.email, "Não informado")"Email do Fornecedor",
coalesce(tel.numero, "Não informado") "Telefone do Fornecedor"
	from produtos prod
		left join itenscompra itc on itc.Produtos_idProduto = prod.idProduto
        left join compras comp on itc.Compras_idCompra = comp.idCompra
        left join fornecedor forn on comp.Fornecedor_cpf_cnpj = forn.cpf_cnpj
        left join telefone tel on tel.Fornecedor_cpf_cnpj = forn.cpf_cnpj
			order by prod.nome;

/*Relatório 12 - Lista dos Produtos mais vendidos, informando a quantidade (total) de vezes que cada produto participou em vendas e o total de valor 
apurado com a venda do produto, trazendo as colunas (Nome Produto, Quantidade (Total) Vendas, Valor Total Recebido pela Venda do Produto), 
ordenado por quantidade de vezes que o produto participou em vendas.*/

select prod.nome "Nome do Produto",
count(vnd.idVenda) "Quantidade (Total) Vendas",
concat("R$ ", format(sum(vnd.valor - vnd.desconto), 2, "de_DE")) "Valor Total Venda"
	from produtos prod
		inner join itensvendaprod ivd on ivd.Produto_idProduto = prod.idProduto
        inner join venda vnd on ivd.Venda_idVenda = vnd.idVenda
			group by prod.nome
				order by count(vnd.idVenda) desc;
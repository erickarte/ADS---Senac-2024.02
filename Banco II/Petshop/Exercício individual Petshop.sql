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
 
 

/*Relatório 3 - Lista dos departamentos com a quantidade de empregados total por cada departamento, trazendo também a média salarial dos 
funcionários do departamento e a média de comissão recebida pelos empregados do departamento, com as colunas 
(Departamento, Quantidade de Empregados, Média Salarial, Média da Comissão), ordenado por nome do departamento;*/



/*Relatório 4 - Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado, além da soma do valor total das vendas do 
empregado e a soma de suas comissões, trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido, 
Total Comissão das Vendas), ordenado por quantidade total de vendas realizadas;*/



/*Relatório 5 - Lista dos empregados que prestaram Serviço na venda computando a quantidade total de vendas realizadas com serviço por cada 
Empregado, além da soma do valor total apurado pelos serviços prestados nas vendas por empregado e a soma de suas comissões, 
trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas com Serviço, Total Valor Vendido com Serviço, 
Total Comissão das Vendas com Serviço), ordenado por quantidade total de vendas realizadas;*/



/*Relatório 6 - Lista dos serviços já realizados por um Pet, trazendo as colunas (Nome do Pet, Data do Serviço, Nome do Serviço, Quantidade, Valor, 
Empregado que realizou o Serviço), ordenado por data do serviço da mais recente a mais antiga;*/



/*Relatório 7 - Lista das vendas já realizados para um Cliente, trazendo as colunas (Data da Venda, Valor, Desconto, Valor Final, 
Empregado que realizou a venda), ordenado por data do serviço da mais recente a mais antiga;*/




/*Relatório 8 - Lista dos 10 serviços mais vendidos, trazendo a quantidade vendas cada serviço, o somatório total dos valores de serviço vendido, 
trazendo as colunas (Nome do Serviço, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;*/



/*Relatório 9 - Lista das formas de pagamentos mais utilizadas nas Vendas, informando quantas vendas cada forma de pagamento já foi relacionada, 
trazendo as colunas (Tipo Forma Pagamento, Quantidade Vendas, Total Valor Vendido), ordenado por quantidade total de vendas realizadas;*/



/*Relatório 10 - Balaço das Vendas, informando a soma dos valores vendidos por dia, trazendo as colunas (Data Venda, Quantidade de Vendas, 
Valor Total Venda), ordenado por Data Venda da mais recente a mais antiga;*/



/*Relatório 11 - Lista dos Produtos, informando qual Fornecedor de cada produto, trazendo as colunas (Nome Produto, Valor Produto, 
Categoria do Produto, Nome Fornecedor, Email Fornecedor, Telefone Fornecedor), ordenado por Nome Produto;*/



/*Relatório 12 - Lista dos Produtos mais vendidos, informando a quantidade (total) de vezes que cada produto participou em vendas e o total de valor 
apurado com a venda do produto, trazendo as colunas (Nome Produto, Quantidade (Total) Vendas, Valor Total Recebido pela Venda do Produto), 
ordenado por quantidade de vezes que o produto participou em vendas.*/
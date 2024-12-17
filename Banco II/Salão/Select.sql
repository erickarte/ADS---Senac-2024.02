-- Consulta para listar os atendimentos realizados em um determinado dia:

SELECT c.nome AS cliente, f.nome AS funcionario, s.nome_servico, at.data_atendimento, at.hora_inicio, at.hora_termino 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE at.data_atendimento = '2024-01-10';

-- Consulta para encontrar a receita total gerada por cada serviço:

SELECT s.nome_servico, SUM(s.preco) AS receita_total 
FROM Agendamentos a 
JOIN Servicos s ON a.id_servico = s.id_servico 
GROUP BY s.nome_servico 
ORDER BY receita_total DESC;

-- Consulta para listar os serviços mais populares entre os clientes:

SELECT s.nome_servico, COUNT(a.id_servico) AS total_agendamentos 
FROM Agendamentos a 
JOIN Servicos s ON a.id_servico = s.id_servico 
GROUP BY s.nome_servico 
ORDER BY total_agendamentos DESC 
LIMIT 5;

-- Consulta para encontrar os funcionários que realizaram mais de 5 atendimentos:

SELECT f.nome AS funcionario, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
GROUP BY f.nome 
HAVING total_atendimentos > 5;

-- Consulta para listar os clientes que agendaram serviços com um determinado funcionário:

SELECT c.nome AS cliente, f.nome AS funcionario, s.nome_servico 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE f.nome = 'Carlos Silva';

-- Consulta para listar os funcionários que foram contratados em um determinado ano:

SELECT nome, cargo, data_contratacao 
FROM Funcionarios 
WHERE YEAR(data_contratacao) = 2023;

-- Consulta para encontrar os agendamentos de um cliente específico:

SELECT c.nome AS cliente, s.nome_servico, a.data_agendamento, a.hora_agendamento, a.status 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE c.nome = 'Ana Souza';

-- Consulta para listar os serviços realizados por um determinado funcionário:

SELECT f.nome AS funcionario, s.nome_servico, COUNT(a.id_servico) AS total_servicos 
FROM Agendamentos a 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE f.nome = 'Maria Oliveira' 
GROUP BY s.nome_servico;

-- Consulta para encontrar os clientes que mais gastaram em serviços:

SELECT c.nome AS cliente, SUM(s.preco) AS total_gasto 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Servicos s ON a.id_servico = s.id_servico 
GROUP BY c.nome 
ORDER BY total_gasto DESC;

-- Consulta para listar os funcionários que realizaram atendimentos em um determinado mês:

SELECT f.nome AS funcionario, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE MONTH(at.data_atendimento) = 1 AND YEAR(at.data_atendimento) = 2024 
GROUP BY f.nome;

-- Consulta para listar os funcionários que realizaram atendimentos em um determinado período:

SELECT f.nome AS funcionario, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE at.data_atendimento BETWEEN '2024-01-01' AND '2024-01-31' 
GROUP BY f.nome;

-- Consulta para encontrar os clientes que agendaram serviços com mais de um funcionário:

SELECT c.nome AS cliente, COUNT(DISTINCT a.id_funcionario) AS total_funcionarios 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
GROUP BY c.nome 
HAVING total_funcionarios > 1;

-- Consulta para listar os serviços que foram agendados mas não realizados:

SELECT s.nome_servico, COUNT(a.id_servico) AS total_agendamentos 
FROM Agendamentos a 
JOIN Servicos s ON a.id_servico = s.id_servico 
LEFT JOIN Atendimentos at ON a.id_agendamento = at.id_agendamento 
WHERE at.id_atendimento IS NULL 
GROUP BY s.nome_servico;

-- Consulta para encontrar os funcionários que realizaram atendimentos em um determinado horário:

SELECT f.nome AS funcionario, at.hora_inicio, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE at.hora_inicio BETWEEN '09:00:00' AND '12:00:00' 
GROUP BY f.nome, at.hora_inicio;

-- Consulta para listar os clientes que agendaram mais de um serviço no mesmo dia:

SELECT c.nome AS cliente, a.data_agendamento, COUNT(a.id_agendamento) AS total_agendamentos 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
GROUP BY c.nome, a.data_agendamento 
HAVING total_agendamentos > 1;

-- Consulta para listar os funcionários que realizaram atendimentos em um determinado dia da semana:

SELECT f.nome AS funcionario, DAYNAME(at.data_atendimento) AS dia_da_semana, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE DAYNAME(at.data_atendimento) = 'Monday' 
GROUP BY f.nome, dia_da_semana;

-- Consulta para encontrar os clientes que agendaram serviços com um determinado preço:

SELECT c.nome AS cliente, s.nome_servico, s.preco 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE s.preco = 50.00;

-- Consulta para listar os serviços que geraram mais receita em um determinado mês:

SELECT s.nome_servico, SUM(s.preco) AS receita_total 
FROM Agendamentos a 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE MONTH(a.data_agendamento) = 1 AND YEAR(a.data_agendamento) = 2024 
GROUP BY s.nome_servico 
ORDER BY receita_total DESC;

-- Consulta para encontrar os funcionários que realizaram atendimentos em um determinado serviço:

SELECT f.nome AS funcionario, s.nome_servico, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE s.nome_servico = 'Corte de Cabelo' 
GROUP BY f.nome, s.nome_servico;

-- Consulta para listar os clientes que nunca agendaram um serviço:

SELECT c.nome AS cliente 
FROM Clientes c 
LEFT JOIN Agendamentos a ON c.id_cliente = a.id_cliente 
WHERE a.id_agendamento IS NULL;

-- Consulta para listar os serviços que foram realizados em um determinado dia da semana:

SELECT s.nome_servico, DAYNAME(at.data_atendimento) AS dia_da_semana, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE DAYNAME(at.data_atendimento) = 'Friday' 
GROUP BY s.nome_servico, dia_da_semana;

-- Consulta para encontrar os clientes que agendaram serviços com um determinado funcionário e mês:

SELECT c.nome AS cliente, f.nome AS funcionario, COUNT(a.id_agendamento) AS total_agendamentos 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE f.nome = 'João Santos' AND MONTH(a.data_agendamento) = 1 AND YEAR(a.data_agendamento) = 2024 
GROUP BY c.nome, f.nome;

-- Consulta para listar os funcionários que realizaram atendimentos em um determinado serviço e mês:

SELECT f.nome AS funcionario, s.nome_servico, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
JOIN Servicos s ON a.id_servico = s.id_servico 
WHERE s.nome_servico = 'Manicure Completa' AND MONTH(at.data_atendimento) = 1 AND YEAR(at.data_atendimento) = 2024 
GROUP BY f.nome, s.nome_servico;

-- Consulta para encontrar os serviços que foram realizados mais de uma vez por um mesmo cliente:

SELECT c.nome AS cliente, s.nome_servico, COUNT(a.id_servico) AS total_servicos 
FROM Agendamentos a 
JOIN Clientes c ON a.id_cliente = c.id_cliente 
JOIN Servicos s ON a.id_servico = s.id_servico 
GROUP BY c.nome, s.nome_servico 
HAVING total_servicos > 1;

-- Consulta para listar os funcionários que realizaram atendimentos em um determinado intervalo de tempo:

SELECT f.nome AS funcionario, COUNT(at.id_atendimento) AS total_atendimentos 
FROM Atendimentos at 
JOIN Agendamentos a ON at.id_agendamento = a.id_agendamento 
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario 
WHERE at.hora_inicio BETWEEN '14:00:00' AND '18:00:00' 
GROUP BY f.nome;
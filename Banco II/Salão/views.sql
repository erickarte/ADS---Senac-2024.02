CREATE VIEW vw_clientes_agendamentos AS
SELECT 
    c.id_cliente, 
    c.nome AS nome_cliente, 
    a.id_agendamento, 
    a.data_agendamento, 
    a.hora_agendamento, 
    s.nome_servico, 
    f.nome AS nome_funcionario
FROM Agendamentos a
JOIN Clientes c ON a.id_cliente = c.id_cliente
JOIN Servicos s ON a.id_servico = s.id_servico
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario;

CREATE VIEW vw_funcionarios_atendimentos AS
SELECT 
    f.id_funcionario, 
    f.nome AS nome_funcionario, 
    COUNT(a.id_atendimento) AS total_atendimentos,
    SUM(s.preco) AS receita_gerada
FROM Atendimentos a
JOIN Agendamentos ag ON a.id_agendamento = ag.id_agendamento
JOIN Funcionarios f ON ag.id_funcionario = f.id_funcionario
JOIN Servicos s ON ag.id_servico = s.id_servico
GROUP BY f.id_funcionario, f.nome;

CREATE VIEW vw_agendamentos_por_status AS
SELECT 
    status, 
    COUNT(id_agendamento) AS total_agendamentos
FROM Agendamentos
GROUP BY status;

CREATE VIEW vw_receita_por_funcionario AS
SELECT 
    f.nome AS funcionario,
    SUM(s.preco) AS receita_total
FROM Funcionarios f
JOIN Agendamentos ag ON f.id_funcionario = ag.id_funcionario
JOIN Servicos s ON ag.id_servico = s.id_servico
GROUP BY f.nome;

CREATE VIEW vw_clientes_frequentes AS
SELECT 
    c.nome AS cliente, 
    COUNT(a.id_agendamento) AS total_agendamentos
FROM Clientes c
JOIN Agendamentos a ON c.id_cliente = a.id_cliente
GROUP BY c.nome
HAVING total_agendamentos > 5;

CREATE VIEW vw_servicos_populares AS
SELECT 
    s.nome_servico, 
    COUNT(a.id_agendamento) AS total_realizado
FROM Servicos s
JOIN Agendamentos a ON s.id_servico = a.id_servico
GROUP BY s.nome_servico
ORDER BY total_realizado DESC;

CREATE VIEW vw_atendimentos_detalhados AS
SELECT 
    at.id_atendimento, 
    c.nome AS cliente,
    f.nome AS funcionario,
    s.nome_servico,
    at.data_atendimento,
    at.hora_inicio,
    at.hora_termino
FROM Atendimentos at
JOIN Agendamentos ag ON at.id_agendamento = ag.id_agendamento
JOIN Clientes c ON ag.id_cliente = c.id_cliente
JOIN Funcionarios f ON ag.id_funcionario = f.id_funcionario
JOIN Servicos s ON ag.id_servico = s.id_servico;

CREATE VIEW vw_clientes_mais_gastaram AS
SELECT 
    c.nome AS cliente, 
    SUM(s.preco) AS total_gasto
FROM Clientes c
JOIN Agendamentos a ON c.id_cliente = a.id_cliente
JOIN Servicos s ON a.id_servico = s.id_servico
GROUP BY c.nome
ORDER BY total_gasto DESC;

CREATE VIEW vw_funcionarios_mais_agendamentos AS
SELECT 
    f.nome AS funcionario, 
    COUNT(a.id_agendamento) AS total_agendamentos
FROM Funcionarios f
JOIN Agendamentos a ON f.id_funcionario = a.id_funcionario
GROUP BY f.nome
ORDER BY total_agendamentos DESC;

CREATE VIEW vw_servicos_realizados_mes AS
SELECT 
    s.nome_servico, 
    COUNT(a.id_agendamento) AS total_realizado
FROM Servicos s
JOIN Agendamentos a ON s.id_servico = a.id_servico
WHERE MONTH(a.data_agendamento) = 1 AND YEAR(a.data_agendamento) = 2024
GROUP BY s.nome_servico
ORDER BY total_realizado DESC;

CREATE VIEW vw_atendimentos_por_funcionario AS
SELECT 
    f.nome AS funcionario, 
    at.id_atendimento, 
    at.data_atendimento, 
    at.hora_inicio, 
    at.hora_termino, 
    s.nome_servico
FROM Atendimentos at
JOIN Agendamentos ag ON at.id_agendamento = ag.id_agendamento
JOIN Funcionarios f ON ag.id_funcionario = f.id_funcionario
JOIN Servicos s ON ag.id_servico = s.id_servico
WHERE f.nome = 'Carlos Silva';
DELIMITER $$

CREATE PROCEDURE ListarServicosPorFuncionario(IN p_id_funcionario INT)
BEGIN
    SELECT 
        s.nome_servico, 
        COUNT(a.id_servico) AS total_realizado
    FROM Agendamentos a
    JOIN Servicos s ON a.id_servico = s.id_servico
    WHERE a.id_funcionario = p_id_funcionario
    GROUP BY s.nome_servico;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarAgendamentosPorCliente(IN p_id_cliente INT)
BEGIN
    SELECT 
        a.id_agendamento, 
        a.data_agendamento, 
        a.hora_agendamento, 
        s.nome_servico, 
        f.nome AS nome_funcionario
    FROM Agendamentos a
    JOIN Servicos s ON a.id_servico = s.id_servico
    JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario
    WHERE a.id_cliente = p_id_cliente;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE CalcularReceitaPorFuncionario(IN p_id_funcionario INT)
BEGIN
    SELECT 
        f.nome AS funcionario, 
        SUM(s.preco) AS receita_total
    FROM Agendamentos a
    JOIN Servicos s ON a.id_servico = s.id_servico
    JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario
    WHERE a.id_funcionario = p_id_funcionario
    GROUP BY f.nome;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarAtendimentosPorPeriodo(IN p_data_inicio DATE, IN p_data_fim DATE)
BEGIN
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
    JOIN Servicos s ON ag.id_servico = s.id_servico
    WHERE at.data_atendimento BETWEEN p_data_inicio AND p_data_fim;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE AtualizarStatusAgendamento(IN p_id_agendamento INT, IN p_novo_status VARCHAR(50))
BEGIN
    UPDATE Agendamentos
    SET status = p_novo_status
    WHERE id_agendamento = p_id_agendamento;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarServicosPopulares()
BEGIN
    SELECT 
        s.nome_servico, 
        COUNT(a.id_servico) AS total_realizado
    FROM Agendamentos a
    JOIN Servicos s ON a.id_servico = s.id_servico
    GROUP BY s.nome_servico
    ORDER BY total_realizado DESC;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarClientesPorFuncionario(IN p_id_funcionario INT)
BEGIN
    SELECT 
        c.nome AS cliente, 
        a.data_agendamento, 
        a.hora_agendamento, 
        s.nome_servico
    FROM Agendamentos a
    JOIN Clientes c ON a.id_cliente = c.id_cliente
    JOIN Servicos s ON a.id_servico = s.id_servico
    WHERE a.id_funcionario = p_id_funcionario;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarClientesSemAgendamentos()
BEGIN
    SELECT 
        c.nome AS cliente, 
        c.telefone, 
        c.email
    FROM Clientes c
    LEFT JOIN Agendamentos a ON c.id_cliente = a.id_cliente
    WHERE a.id_agendamento IS NULL;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE ListarFuncionariosPorMes(IN p_mes INT, IN p_ano INT)
BEGIN
    SELECT 
        f.nome AS funcionario, 
        COUNT(at.id_atendimento) AS total_atendimentos
    FROM Atendimentos at
    JOIN Agendamentos ag ON at.id_agendamento = ag.id_agendamento
    JOIN Funcionarios f ON ag.id_funcionario = f.id_funcionario
    WHERE MONTH(at.data_atendimento) = p_mes AND YEAR(at.data_atendimento) = p_ano
    GROUP BY f.nome;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE CalcularReceitaPorServico(IN p_id_servico INT)
BEGIN
    SELECT 
        s.nome_servico, 
        SUM(s.preco) AS receita_total
    FROM Agendamentos a
    JOIN Servicos s ON a.id_servico = s.id_servico
    WHERE a.id_servico = p_id_servico
    GROUP BY s.nome_servico;
END$$

DELIMITER ;
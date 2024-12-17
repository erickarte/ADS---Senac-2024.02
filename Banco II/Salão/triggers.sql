DELIMITER //

CREATE TRIGGER tg_atualiza_status_concluido
AFTER INSERT ON Atendimentos
FOR EACH ROW
BEGIN
    UPDATE Agendamentos
    SET status = 'Concluído'
    WHERE id_agendamento = NEW.id_agendamento;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tg_verifica_horario
BEFORE INSERT ON Agendamentos
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Agendamentos
        WHERE data_agendamento = NEW.data_agendamento
        AND hora_agendamento = NEW.hora_agendamento
        AND id_funcionario = NEW.id_funcionario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Funcionário já possui um agendamento nesse horário.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tg_atualiza_hora_termino
BEFORE UPDATE ON Atendimentos
FOR EACH ROW
BEGIN
    IF NEW.hora_termino IS NULL THEN
        SET NEW.hora_termino = ADDTIME(NEW.hora_inicio, (SELECT duracao_estimada FROM Servicos WHERE id_servico = (SELECT id_servico FROM Agendamentos WHERE id_agendamento = NEW.id_agendamento)));
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tg_atualiza_salario_funcionario
BEFORE UPDATE ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.cargo <> OLD.cargo THEN
        SET NEW.salario = CASE NEW.cargo
            WHEN 'Cabeleireiro' THEN 2500.00
            WHEN 'Manicure' THEN 1800.00
            WHEN 'Recepcionista' THEN 1500.00
            WHEN 'Colorista' THEN 2300.00
            WHEN 'Esteticista' THEN 2000.00
            ELSE NEW.salario
        END;
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tg_registra_data_criacao_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    SET NEW.data_criacao = NOW();
END//

DELIMITER ;

DELIMITER //

DELIMITER //

CREATE TRIGGER tg_atualiza_data_contratacao
BEFORE UPDATE ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_contratacao <> OLD.data_contratacao THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de contratação não pode ser alterada.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER tg_verifica_email_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O campo de email não pode ser vazio.';
    END IF;
END;
//

DELIMITER ;
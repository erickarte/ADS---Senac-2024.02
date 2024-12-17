DELIMITER //

CREATE FUNCTION calcula_salario_anual(id_funcionario INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE salario_mensal DECIMAL(10, 2);
    DECLARE salario_anual DECIMAL(10, 2);

    SELECT salario INTO salario_mensal
    FROM Funcionarios
    WHERE id_funcionario = id_funcionario;

    SET salario_anual = salario_mensal * 12;
    RETURN salario_anual;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION verifica_disponibilidade_funcionario(id_funcionario INT, data_agendamento DATE, hora_agendamento TIME) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE disponibilidade BOOLEAN;

    SET disponibilidade = NOT EXISTS (
        SELECT 1
        FROM Agendamentos
        WHERE id_funcionario = id_funcionario
        AND data_agendamento = data_agendamento
        AND hora_agendamento = hora_agendamento
    );

    RETURN disponibilidade;
END;
//

DELIMITER ;
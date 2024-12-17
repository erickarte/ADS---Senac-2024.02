INSERT INTO Funcionarios (nome, cpf, cargo, salario, data_contratacao) VALUES
('Carlos Silva', '12345678901', 'Cabeleireiro', 2500.00, '2022-01-15'),
('Maria Oliveira', '98765432100', 'Manicure', 1800.00, '2023-02-20'),
('João Santos', '45678912345', 'Recepcionista', 1500.00, '2023-05-10'),
('Ana Costa', '78945612300', 'Colorista', 2300.00, '2022-07-25'),
('Fernanda Luz', '32165498700', 'Esteticista', 2000.00, '2023-08-01');

INSERT INTO Clientes (nome, telefone, email, endereco) VALUES
('Ana Souza', '(81) 99999-1111', 'ana.souza@example.com', 'Rua Flores, 123'),
('João Pedro', '(81) 98888-2222', 'joao.pedro@example.com', 'Av. Brasil, 456'),
('Mariana Lima', '(81) 97777-3333', 'mariana.lima@example.com', 'Rua das Palmeiras, 789'),
('Lucas Mendes', '(81) 96666-4444', 'lucas.mendes@example.com', 'Av. Boa Viagem, 321'),
('Fernanda Silva', '(81) 95555-5555', 'fernanda.silva@example.com', 'Rua Aurora, 654');

INSERT INTO Servicos (nome_servico, preco, duracao_estimada) VALUES
('Corte de Cabelo', 50.00, '00:30:00'),
('Manicure Completa', 40.00, '01:00:00'),
('Pintura de Cabelo', 150.00, '02:00:00'),
('Hidratação', 80.00, '01:30:00'),
('Depilação', 60.00, '01:00:00');

INSERT INTO Agendamentos (id_cliente, id_funcionario, id_servico, data_agendamento, hora_agendamento, status) VALUES
(1, 1, 1, '2024-01-10', '10:00:00', 'Agendado'),
(2, 2, 2, '2024-01-11', '11:00:00', 'Agendado'),
(3, 1, 3, '2024-01-12', '14:00:00', 'Agendado'),
(4, 3, 4, '2024-01-13', '09:30:00', 'Agendado'),
(5, 4, 5, '2024-01-14', '15:00:00', 'Agendado'),
(1, 2, 4, '2024-01-15', '09:00:00', 'Agendado'),
(2, 1, 5, '2024-01-16', '13:00:00', 'Agendado'),
(6, 5, 6, '2024-01-17', '10:00:00', 'Agendado'),
(7, 6, 7, '2024-01-18', '11:00:00', 'Agendado'),
(8, 7, 8, '2024-01-19', '14:00:00', 'Agendado'),
(9, 8, 9, '2024-01-20', '09:30:00', 'Agendado'),
(10, 9, 10, '2024-01-21', '15:00:00', 'Agendado'),
(6, 10, 1, '2024-01-22', '09:00:00', 'Agendado'),
(7, 9, 2, '2024-01-23', '13:00:00', 'Agendado'),
(8, 8, 3, '2024-01-24', '10:30:00', 'Agendado'),
(9, 7, 4, '2024-01-25', '11:30:00', 'Agendado'),
(10, 6, 5, '2024-01-26', '12:00:00', 'Agendado');

INSERT INTO Atendimentos (id_agendamento, data_atendimento, hora_inicio, hora_termino, observacoes) VALUES
(1, '2024-01-10', '10:00:00', '10:30:00', 'Atendimento realizado sem problemas'),
(2, '2024-01-11', '11:00:00', '12:00:00', 'Cliente solicitou design especial nas unhas'),
(3, '2024-01-12', '14:00:00', '16:00:00', 'Cliente pediu coloração personalizada'),
(4, '2024-01-13', '09:30:00', '11:00:00', 'Hidratação capilar concluída'),
(5, '2024-01-14', '15:00:00', '16:00:00', 'Depilação rápida e eficiente');


INSERT INTO Funcionarios (nome, cpf, cargo, salario, data_contratacao) VALUES
('Pedro Almeida', '11122233344', 'Barbeiro', 2200.00, '2023-03-15'),
('Juliana Ferreira', '55566677788', 'Massoterapeuta', 2400.00, '2023-04-10'),
('Ricardo Lima', '99988877766', 'Cabeleireiro', 2600.00, '2022-11-20'),
('Patrícia Gomes', '44455566677', 'Manicure', 1900.00, '2023-06-05'),
('Roberto Nunes', '33344455566', 'Recepcionista', 1600.00, '2023-07-18'),
('Cláudia Souza', '22233344455', 'Colorista', 2350.00, '2022-09-25'),
('Marcos Silva', '88899900011', 'Esteticista', 2100.00, '2023-10-01'),
('Renata Alves', '77788899900', 'Barbeira', 2250.00, '2023-11-12'),
('Thiago Pereira', '66677788899', 'Massoterapeuta', 2450.00, '2023-12-03'),
('Vanessa Rocha', '55566677700', 'Cabeleireira', 2700.00, '2022-08-15');

INSERT INTO Clientes (nome, telefone, email, endereco) VALUES
('Pedro Henrique', '(81) 94444-6666', 'pedro.henrique@example.com', 'Rua das Acácias, 987'),
('Juliana Costa', '(81) 93333-7777', 'juliana.costa@example.com', 'Av. Recife, 1234'),
('Ricardo Santos', '(81) 92222-8888', 'ricardo.santos@example.com', 'Rua do Sol, 567'),
('Patrícia Lima', '(81) 91111-9999', 'patricia.lima@example.com', 'Av. Boa Vista, 890'),
('Roberto Silva', '(81) 90000-0000', 'roberto.silva@example.com', 'Rua das Flores, 321'),
('Cláudia Nunes', '(81) 98888-1111', 'claudia.nunes@example.com', 'Av. Brasil, 654'),
('Marcos Almeida', '(81) 97777-2222', 'marcos.almeida@example.com', 'Rua das Palmeiras, 432'),
('Renata Pereira', '(81) 96666-3333', 'renata.pereira@example.com', 'Av. Boa Viagem, 876'),
('Thiago Rocha', '(81) 95555-4444', 'thiago.rocha@example.com', 'Rua Aurora, 789'),
('Vanessa Mendes', '(81) 94444-5555', 'vanessa.mendes@example.com', 'Av. Recife, 210');

INSERT INTO Servicos (nome_servico, preco, duracao_estimada) VALUES
('Corte Masculino', 45.00, '00:30:00'),
('Pedicure', 35.00, '01:00:00'),
('Escova Progressiva', 200.00, '03:00:00'),
('Massagem Relaxante', 120.00, '01:30:00'),
('Limpeza de Pele', 90.00, '01:00:00'),
('Maquiagem', 100.00, '01:00:00'),
('Tratamento Capilar', 130.00, '01:30:00'),
('Design de Sobrancelhas', 50.00, '00:45:00'),
('Barba', 30.00, '00:20:00'),
('Penteado', 150.00, '02:00:00');

INSERT INTO Agendamentos (id_cliente, id_funcionario, id_servico, data_agendamento, hora_agendamento, status) VALUES
(6, 5, 6, '2024-01-17', '10:00:00', 'Agendado'),
(7, 6, 7, '2024-01-18', '11:00:00', 'Agendado'),
(8, 7, 8, '2024-01-19', '14:00:00', 'Agendado'),
(9, 8, 9, '2024-01-20', '09:30:00', 'Agendado'),
(10, 9, 10, '2024-01-21', '15:00:00', 'Agendado'),
(6, 10, 1, '2024-01-22', '09:00:00', 'Agendado'),
(7, 9, 2, '2024-01-23', '13:00:00', 'Agendado'),
(8, 8, 3, '2024-01-24', '10:30:00', 'Agendado'),
(9, 7, 4, '2024-01-25', '11:30:00', 'Agendado'),
(10, 6, 5, '2024-01-26', '12:00:00', 'Agendado');

INSERT INTO Atendimentos (id_agendamento, data_atendimento, hora_inicio, hora_termino, observacoes) VALUES
(6, '2024-01-17', '10:00:00', '11:00:00', 'Cliente pediu maquiagem para evento especial'),
(7, '2024-01-18', '11:00:00', '12:30:00', 'Massagem relaxante com óleos essenciais'),
(8, '2024-01-19', '14:00:00', '15:30:00', 'Design de sobrancelhas com henna'),
(9, '2024-01-20', '09:30:00', '09:50:00', 'Barba feita com navalha'),
(10, '2024-01-21', '15:00:00', '17:00:00', 'Penteado para casamento'),
(6, '2024-01-22', '09:00:00', '09:30:00', 'Corte masculino tradicional'),
(7, '2024-01-23', '13:00:00', '14:00:00', 'Pedicure com esmaltação'),
(8, '2024-01-24', '10:30:00', '13:30:00', 'Escova progressiva completa'),
(9, '2024-01-25', '11:30:00', '13:00:00', 'Limpeza de pele profunda'),
(10, '2024-01-26', '12:00:00', '13:00:00', 'Depilação completa');

INSERT INTO Clientes (nome, telefone, email, endereco) VALUES
('Gabriel Souza', '(81) 93333-1111', 'gabriel.souza@example.com', 'Rua das Laranjeiras, 123'),
('Larissa Oliveira', '(81) 92222-2222', 'larissa.oliveira@example.com', 'Av. Recife, 456'),
('Felipe Santos', '(81) 91111-3333', 'felipe.santos@example.com', 'Rua do Sol, 789'),
('Juliana Lima', '(81) 90000-4444', 'juliana.lima@example.com', 'Av. Boa Vista, 321'),
('Rafael Mendes', '(81) 98888-5555', 'rafael.mendes@example.com', 'Rua das Flores, 654'),
('Beatriz Costa', '(81) 97777-6666', 'beatriz.costa@example.com', 'Av. Brasil, 987'),
('Lucas Almeida', '(81) 96666-7777', 'lucas.almeida@example.com', 'Rua das Palmeiras, 432'),
('Mariana Pereira', '(81) 95555-8888', 'mariana.pereira@example.com', 'Av. Boa Viagem, 876'),
('Thiago Rocha', '(81) 94444-9999', 'thiago.rocha@example.com', 'Rua Aurora, 789'),
('Vanessa Mendes', '(81) 93333-0000', 'vanessa.mendes@example.com', 'Av. Recife, 210'),
('Bruno Silva', '(81) 92222-1111', 'bruno.silva@example.com', 'Rua das Acácias, 123'),
('Camila Ferreira', '(81) 91111-2222', 'camila.ferreira@example.com', 'Av. Recife, 456'),
('Daniel Souza', '(81) 90000-3333', 'daniel.souza@example.com', 'Rua do Sol, 789'),
('Fernanda Lima', '(81) 98888-4444', 'fernanda.lima@example.com', 'Av. Boa Vista, 321'),
('Gustavo Mendes', '(81) 97777-5555', 'gustavo.mendes@example.com', 'Rua das Flores, 654'),
('Isabela Costa', '(81) 96666-6666', 'isabela.costa@example.com', 'Av. Brasil, 987'),
('João Almeida', '(81) 95555-7777', 'joao.almeida@example.com', 'Rua das Palmeiras, 432'),
('Karina Pereira', '(81) 94444-8888', 'karina.pereira@example.com', 'Av. Boa Viagem, 876'),
('Leonardo Rocha', '(81) 93333-9999', 'leonardo.rocha@example.com', 'Rua Aurora, 789'),
('Mariana Mendes', '(81) 92222-0000', 'mariana.mendes@example.com', 'Av. Recife, 210');

INSERT INTO Agendamentos (id_cliente, id_funcionario, id_servico, data_agendamento, hora_agendamento, status) VALUES
(18, 17, 8, '2024-02-13', '14:00:00', 'Agendado'),
(19, 18, 9, '2024-02-14', '09:30:00', 'Agendado'),
(20, 19, 10, '2024-02-15', '15:00:00', 'Agendado'),
(21, 20, 1, '2024-02-16', '09:00:00', 'Agendado');

INSERT INTO Atendimentos (id_agendamento, data_atendimento, hora_inicio, hora_termino, observacoes) VALUES
(11, '2024-02-01', '09:00:00', '09:30:00', 'Corte masculino tradicional'),
(12, '2024-02-02', '13:00:00', '14:00:00', 'Pedicure com esmaltação'),
(13, '2024-02-03', '10:30:00', '13:30:00', 'Escova progressiva completa'),
(14, '2024-02-04', '11:30:00', '13:00:00', 'Limpeza de pele profunda'),
(15, '2024-02-05', '12:00:00', '13:00:00', 'Depilação completa'),
(16, '2024-02-06', '10:00:00', '11:00:00', 'Cliente pediu maquiagem para evento especial'),
(17, '2024-02-07', '11:00:00', '12:30:00', 'Massagem relaxante com óleos essenciais'),
(18, '2024-02-08', '14:00:00', '15:30:00', 'Design de sobrancelhas com henna'),
(19, '2024-02-09', '09:30:00', '09:50:00', 'Barba feita com navalha'),
(20, '2024-02-10', '15:00:00', '17:00:00', 'Penteado para casamento'),
(21, '2024-02-11', '09:00:00', '09:30:00', 'Corte masculino tradicional'),
(22, '2024-02-12', '13:00:00', '14:00:00', 'Pedicure com esmaltação'),
(23, '2024-02-13', '10:30:00', '13:30:00', 'Escova progressiva completa'),
(24, '2024-02-14', '11:30:00', '13:00:00', 'Limpeza de pele profunda'),
(25, '2024-02-15', '12:00:00', '13:00:00', 'Depilação completa'),
(26, '2024-02-16', '10:00:00', '11:00:00', 'Cliente pediu maquiagem para evento especial'),
(27, '2024-02-17', '11:00:00', '12:30:00', 'Massagem relaxante com óleos essenciais'),
(28, '2024-02-18', '14:00:00', '15:30:00', 'Design de sobrancelhas com henna'),
(29, '2024-02-19', '09:30:00', '09:50:00', 'Barba feita com navalha'),
(30, '2024-02-20', '15:00:00', '17:00:00', 'Penteado para casamento');

INSERT INTO Atendimentos (id_agendamento, data_atendimento, hora_inicio, hora_termino, observacoes) VALUES
(31, '2024-02-21', '09:00:00', '09:30:00', 'Corte masculino tradicional'),
(32, '2024-02-22', '13:00:00', '14:00:00', 'Pedicure com esmaltação'),
(33, '2024-02-23', '10:30:00', '13:30:00', 'Escova progressiva completa'),
(34, '2024-02-24', '11:30:00', '13:00:00', 'Limpeza de pele profunda'),
(35, '2024-02-25', '12:00:00', '13:00:00', 'Depilação completa'),
(36, '2024-02-26', '10:00:00', '11:00:00', 'Cliente pediu maquiagem para evento especial'),
(37, '2024-02-27', '11:00:00', '12:30:00', 'Massagem relaxante com óleos essenciais'),
(38, '2024-02-28', '14:00:00', '15:30:00', 'Design de sobrancelhas com henna'),
(39, '2024-02-29', '09:30:00', '09:50:00', 'Barba feita com navalha'),
(40, '2024-03-01', '15:00:00', '17:00:00', 'Penteado para casamento'),
(41, '2024-03-02', '09:00:00', '09:30:00', 'Corte masculino tradicional'),
(42, '2024-03-03', '13:00:00', '14:00:00', 'Pedicure com esmaltação'),
(43, '2024-03-04', '10:30:00', '13:30:00', 'Escova progressiva completa'),
(44, '2024-03-05', '11:30:00', '13:00:00', 'Limpeza de pele profunda'),
(45, '2024-03-06', '12:00:00', '13:00:00', 'Depilação completa'),
(46, '2024-03-07', '10:00:00', '11:00:00', 'Cliente pediu maquiagem para evento especial'),
(47, '2024-03-08', '11:00:00', '12:30:00', 'Massagem relaxante com óleos essenciais'),
(48, '2024-03-09', '14:00:00', '15:30:00', 'Design de sobrancelhas com henna'),
(49, '2024-03-10', '09:30:00', '09:50:00', 'Barba feita com navalha'),
(50, '2024-03-11', '15:00:00', '17:00:00', 'Penteado para casamento');
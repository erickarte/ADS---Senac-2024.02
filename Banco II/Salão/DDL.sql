-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SalaoSenac
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SalaoSenac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SalaoSenac` DEFAULT CHARACTER SET utf8 ;
USE `SalaoSenac` ;

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    endereco TEXT
);

CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    duracao_estimada TIME NOT NULL
);

CREATE TABLE Agendamentos (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_servico INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

CREATE TABLE Atendimentos (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    id_agendamento INT NOT NULL,
    data_atendimento DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_termino TIME,
    observacoes TEXT,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamentos(id_agendamento)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

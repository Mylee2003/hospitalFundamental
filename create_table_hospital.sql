-- ==========================================================
-- Banco de Dados Hospital
-- Criação das tabelas 
-- ==========================================================

DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

-- ==========================================================
-- ENTIDADE: Endereco
-- Cada paciente terá um endereço
-- ==========================================================
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(80),
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    complemento VARCHAR(110),
    cep VARCHAR(10)
);

-- ==========================================================
-- ENTIDADE: Especialidade
-- cada medico tem uma especialidade
-- ==========================================================
CREATE TABLE Especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_especialidade VARCHAR(100) NOT NULL,
    status TINYINT DEFAULT 1
);

-- ==========================================================
-- ENTIDADE: Medico
-- 
-- ==========================================================
CREATE TABLE Medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm INT UNIQUE NOT NULL,
    email VARCHAR(100),
    data_nasc DATE,
    id_especialidade INT,
    em_atividade BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
);

-- ==========================================================
-- RELACIONAMENTO: Medico ↔ Especialidade (muitos-para-muitos)
-- ==========================================================
CREATE TABLE Tem (
    fk_medico_id INT NOT NULL,
    fk_especialidade_id INT NOT NULL,
    data_inicio DATE,
    PRIMARY KEY(fk_medico_id, fk_especialidade_id),
    FOREIGN KEY(fk_medico_id) REFERENCES Medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(fk_especialidade_id) REFERENCES Especialidade(id_especialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ==========================================================
-- ENTIDADE: Convenio
-- Ao menos quatro convênios médicos
-- ==========================================================
CREATE TABLE Convenio (
    id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    nome_convenio VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20),
    tempo_carencia VARCHAR(50),
    n_carteira varchar(50)
);

-- ==========================================================
-- ENTIDADE: Paciente
-- Ao menos 15 pacientes
-- ==========================================================
CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome_paciente VARCHAR(100) NOT NULL,
    data_nasc DATE,
    cpf_paciente VARCHAR(15) UNIQUE NOT NULL,
    id_endereco INT,
    telefone VARCHAR(15),
    email VARCHAR(100),
    rg_paciente VARCHAR(15),
    id_convenio INT,
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio) ON DELETE SET NULL ON UPDATE CASCADE
);

-- ==========================================================
-- ENTIDADE: Consulta
-- Cada consulta tem paciente, médico e convênio
-- ==========================================================
CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_convenio INT,
    valor DECIMAL(10,2),
    FOREIGN KEY(id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY(id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY(id_convenio) REFERENCES Convenio(id_convenio)
);

-- ==========================================================
-- ENTIDADE: Remedio
-- ==========================================================
CREATE TABLE Remedio (
    id_remedio INT AUTO_INCREMENT PRIMARY KEY,
    nome_remedio VARCHAR(100) NOT NULL,
    tipo_remedio VARCHAR(50),
    descricao_composicao VARCHAR(255)
);

ALTER TABLE Remedio 
ADD COLUMN quantidade_embalagem VARCHAR(50);

-- ==========================================================
-- ENTIDADE: Receita
-- Cada receita está ligada a uma consulta
-- ==========================================================
CREATE TABLE Receita (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT NOT NULL,
    observacao VARCHAR(255),
    status ENUM('emitida','entregue','cancelada') DEFAULT 'emitida',
    FOREIGN KEY(id_consulta) REFERENCES Consulta(id_consulta)
);

alter table receita add column quantidade_remedio int;
-- ==========================================================
-- RELACIONAMENTO: Prescreve (Receita ↔ Remédio)
-- 
-- ==========================================================
CREATE TABLE Prescreve (
    fk_receita_id INT NOT NULL,
    fk_remedio_id INT NOT NULL,
    quantidade INT,
    instrucao_de_uso VARCHAR(255),
    PRIMARY KEY(fk_receita_id, fk_remedio_id),
    FOREIGN KEY(fk_receita_id) REFERENCES Receita(id_receita) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(fk_remedio_id) REFERENCES Remedio(id_remedio) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ==========================================================
-- ENTIDADE: Tipo_Quarto
-- 
-- ==========================================================
CREATE TABLE Tipo_Quarto (
    id_tipo_quarto INT AUTO_INCREMENT PRIMARY KEY,
    descricao ENUM('Apartamento','Quarto Duplo','Enfermaria','VIP','Compartilhado') NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

-- ==========================================================
-- ENTIDADE: Quarto
-- ==========================================================
CREATE TABLE Quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    id_tipo_quarto INT,
    FOREIGN KEY(id_tipo_quarto) REFERENCES Tipo_Quarto(id_tipo_quarto)
);

-- ==========================================================
-- ENTIDADE: Enfermeiro
-- ==========================================================
CREATE TABLE Enfermeiro (
    id_enfermeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(15),
    coren VARCHAR(20)
);

-- ==========================================================
-- ENTIDADE: Internacao
-- Chaves estrangeiras: Médico, Paciente, Quarto
-- ==========================================================
CREATE TABLE Internacao (
    id_internacao INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE,
    data_alta DATE,
    procedimento VARCHAR(255),
    fk_quarto_id INT NOT NULL,
    fk_id_paciente INT NOT NULL,
    fk_id_medico INT NOT NULL,
    FOREIGN KEY(fk_quarto_id) REFERENCES Quarto(id_quarto),
    FOREIGN KEY(fk_id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY(fk_id_medico) REFERENCES Medico(id_medico)
);

-- ==========================================================
-- RELACIONAMENTO: Internacao ↔ Enfermeiro
-- ==========================================================
CREATE TABLE Requer (
    fk_internacao_id INT NOT NULL,
    fk_enfermeiro_id INT NOT NULL,
    PRIMARY KEY(fk_internacao_id, fk_enfermeiro_id),
    FOREIGN KEY(fk_internacao_id) REFERENCES Internacao(id_internacao) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(fk_enfermeiro_id) REFERENCES Enfermeiro(id_enfermeiro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

-- ========== ENTIDADES PRINCIPAIS ==========

CREATE TABLE Especialidade (
    id_especialidade INT PRIMARY KEY,
    nome_especialidade VARCHAR(100),
    status TINYINT
);
CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY,
    data_hora DATETIME,
    cpf_paciente VARCHAR(15),
    crm_medico INT,
    valor DECIMAL(10,2),
    especialidade_medico INT,
    FOREIGN KEY (especialidade_medico) REFERENCES Especialidade(id_especialidade)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(100),
    crm INT UNIQUE,
    email VARCHAR(100),
    data_nasc DATE,
    id_especialidade INT,
    fk_consulta_id INT,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade),
    FOREIGN KEY (fk_consulta_id) REFERENCES Consulta(id_consulta)
);


CREATE TABLE Convenio (
    id_convenio INT PRIMARY KEY,
    nome_convenio VARCHAR(100),
    cnpj VARCHAR(20),
    tempo_carencia VARCHAR(50),
    n_carteira VARCHAR(50)
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nome_paciente VARCHAR(100),
    data_nasc DATE,
    cpf_paciente VARCHAR(15) UNIQUE,
    id_endereco INT,
    telefone VARCHAR(15),
    email VARCHAR(100),
    rg_paciente VARCHAR(15),
    id_convenio INT,
    fk_consulta_id INT,
    FOREIGN KEY (id_convenio) REFERENCES Convenio(id_convenio),
    FOREIGN KEY (fk_consulta_id) REFERENCES Consulta(id_consulta)
);


CREATE TABLE Remedio (
    id_remedio INT PRIMARY KEY,
    nome_remedio VARCHAR(100),
    instrucao_de_uso VARCHAR(255)
);

CREATE TABLE Receita (
    id_receita INT PRIMARY KEY,
    id_remedio INT,
    id_consulta INT,
    quantidade_remedio INT,
    FOREIGN KEY (id_remedio) REFERENCES Remedio(id_remedio),
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

CREATE TABLE Tipo_Quarto (
    id_tipo_quarto INT PRIMARY KEY,
    descricao VARCHAR(50),
    valor_diaria DECIMAL(10,2)
);

CREATE TABLE Quarto (
    id_quarto INT PRIMARY KEY,
    numero VARCHAR(10),
    id_tipo_quarto INT,
    FOREIGN KEY (id_tipo_quarto) REFERENCES Tipo_Quarto(id_tipo_quarto)
);

CREATE TABLE Enfermeiro (
    id_enfermeiro INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(15),
    coren VARCHAR(20)
);

CREATE TABLE Internacao (
    id_internacao INT PRIMARY KEY,
    data_entrada DATE,
    data_prev_alta DATE,
    data_alta DATE,
    procedimento VARCHAR(255),
    fk_quarto_id INT,
    fk_id_paciente INT,
    fk_id_medico INT,
    FOREIGN KEY (fk_quarto_id) REFERENCES Quarto(id_quarto),
    FOREIGN KEY (fk_id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (fk_id_medico) REFERENCES Medico(id_medico)
);

-- RELACIONAMENTOS 

CREATE TABLE Prescreve (
    fk_remedio_id INT,
    fk_receita_id INT,
    FOREIGN KEY (fk_remedio_id) REFERENCES Remedio(id_remedio),
    FOREIGN KEY (fk_receita_id) REFERENCES Receita(id_receita)
);

CREATE TABLE Registra (
    fk_consulta_id INT,
    fk_receita_id INT,
    FOREIGN KEY (fk_consulta_id) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (fk_receita_id) REFERENCES Receita(id_receita)
);

CREATE TABLE Requer (
    fk_internacao_id INT,
    fk_enfermeiro_id INT,
    FOREIGN KEY (fk_internacao_id) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (fk_enfermeiro_id) REFERENCES Enfermeiro(id_enfermeiro)
);

CREATE TABLE Fica (
    fk_internacao_id INT,
    fk_paciente_id INT,
    FOREIGN KEY (fk_internacao_id) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (fk_paciente_id) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Responsavel (
    fk_internacao_id INT,
    fk_medico_id INT,
    FOREIGN KEY (fk_internacao_id) REFERENCES Internacao(id_internacao),
    FOREIGN KEY (fk_medico_id) REFERENCES Medico(id_medico)
);

CREATE TABLE Tem (
    fk_medico_id INT,
    fk_especialidade_id INT,
    FOREIGN KEY (fk_medico_id) REFERENCES Medico(id_medico),
    FOREIGN KEY (fk_especialidade_id) REFERENCES Especialidade(id_especialidade)
);

CREATE TABLE Possui_Convenio (
    fk_paciente_id INT,
    fk_convenio_id INT,
    FOREIGN KEY (fk_paciente_id) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (fk_convenio_id) REFERENCES Convenio(id_convenio)
);

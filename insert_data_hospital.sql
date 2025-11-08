USE hospital;

-- ==================================================
-- 1. Inserção de Especialidades (mínimo 7, mas colocaremos 9)
-- Inclui pediatria, clínica geral, gastrenterologia e dermatologia
-- ==================================================
INSERT INTO Especialidade (nome_especialidade, status) VALUES
('Clínico Geral', TRUE),
('Cardiologia', TRUE),
('Pediatria', TRUE),
('Dermatologia', TRUE),
('Gastroenterologia', TRUE),
('Endocrinologia', TRUE),
('Neurologia', TRUE),
('Psiquiatria', TRUE),
('Ortopedia', TRUE);

-- ==================================================
-- 2. Inserção de Convênios (mínimo 4)
-- ==================================================
INSERT INTO Convenio (nome_convenio, cnpj, tempo_carencia, n_carteira) VALUES
('Saúde Total', '12.345.678/0001-90', '30 dias', 'ST123'),
('Vida Melhor', '98.765.432/0001-12', '60 dias', 'VM456'),
('Bem Estar', '22.333.444/0001-55', '45 dias', 'BE789'),
('Mais Vida', '55.666.777/0001-88', '15 dias', 'MV321'),
('Top Saúde', '44.555.666/0001-22', '90 dias', 'TS654');

-- ==================================================
-- 3. Inserção de Endereços
-- ==================================================
INSERT INTO Endereco (pais, rua, numero, bairro, cidade, estado, complemento, cep) VALUES
('Brasil', 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', 'Apto 101', '01001-000'),
('Brasil', 'Avenida Paulista', '1578', 'Bela Vista', 'São Paulo', 'SP', 'Conjunto 802', '01310-200'),
('Brasil', 'Rua XV de Novembro', '45', 'Centro', 'Curitiba', 'PR', 'Casa 2', '80020-310'),
('Brasil', 'Rua dos Pinheiros', '500', 'Pinheiros', 'São Paulo', 'SP', 'Bloco A', '05422-000'),
('Brasil', 'Avenida Atlântica', '2220', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Frente Mar', '22021-001'),
('Brasil', 'Rua das Palmeiras', '12', 'Jardins', 'São Paulo', 'SP', 'Apto 301', '01415-002'),
('Brasil', 'Rua das Acácias', '300', 'Centro', 'Belo Horizonte', 'MG', 'Próximo à praça', '30130-100'),
('Brasil', 'Avenida Brasil', '950', 'Centro', 'Campinas', 'SP', 'Sala 5', '13015-000'),
('Brasil', 'Rua Dom Pedro II', '85', 'Centro', 'Fortaleza', 'CE', 'Casa de esquina', '60060-090'),
('Brasil', 'Rua das Rosas', '200', 'Jardim América', 'Goiânia', 'GO', 'Fundos', '74050-300');

-- ==================================================
-- 4. Inserção de Pacientes (mínimo 15)
-- ==================================================
INSERT INTO Paciente (nome_paciente, data_nasc, cpf_paciente, id_endereco, telefone, email, rg_paciente, id_convenio) VALUES
('Lucas Pereira','2000-02-15','12345678900',1,'11999990001','lucas@mail.com','MG1234567',1),
('Fernanda Costa','1988-10-09','98765432100',2,'11999990002','fernanda@mail.com','SP7654321',2),
('José Almeida','1975-06-21','45678912300',3,'11999990003','jose@mail.com','RJ3456789',3),
('Carla Mendes','1995-03-30','32165498700',4,'11999990004','carla@mail.com','BA9876543',4),
('Mariana Lima','2002-12-25','15975348600',5,'11999990005','mariana@mail.com','PE6543219',1),
('Rafael Souza','1990-07-10','75395145600',6,'11999990006','rafael@mail.com','SP5678901',2),
('Amanda Oliveira','1998-11-19','95175325800',7,'11999990007','amanda@mail.com','MG3456782',3),
('Pedro Santos','1985-09-05','85245615900',8,'11999990008','pedro@mail.com','RJ5678123',4),
('Juliana Ramos','1992-04-14','14725836900',9,'11999990009','juliana@mail.com','BA6789124',1),
('Thiago Nunes','1983-03-09','36925814700',10,'11999990010','thiago@mail.com','PR7891234',2),
('Patrícia Gomes','1999-12-01','25836914700',11,'11999990011','patricia@mail.com','PE8912345',3),
('Rodrigo Martins','1987-06-18','35715948600',12,'11999990012','rodrigo@mail.com','RS9123456',4),
('Beatriz Fernandes','1996-05-23','65478932100',13,'11999990013','beatriz@mail.com','GO1234567',1),
('Gustavo Rocha','2001-01-09','78912345600',14,'11999990014','gustavo@mail.com','RN2345678',2),
('Camila Ribeiro','1993-08-27','95148675300',15,'11999990015','camila@mail.com','AM3456789',3),
('Vitor Cardoso','1982-04-15','32198765400',16,'11999990016','vitor@mail.com','MG5671238',4),
('Renata Alves','1991-12-05','65432198700',17,'11999990017','renata@mail.com','SP8764321',1),
('Fábio Nunes','1985-07-20','98765412300',18,'11999990018','fabio@mail.com','RJ3459876',2),
('Aline Dias','1997-03-11','15975348601',19,'11999990019','aline@mail.com','BA4567891',3),
('Eduardo Lima','1990-09-09','75315985200',20,'11999990020','eduardo@mail.com','PE3216549',4);

-- ==================================================
-- 5. Inserção de Médicos (mínimo 10)
-- ==================================================
INSERT INTO Medico (nome, crm, email, data_nasc, id_especialidade, em_atividade) VALUES
('Dr. João Silva', 12345, 'joao@hospital.com', '1980-05-10', 1, TRUE),
('Dr. Carlos Souza', 54321, 'carlos@hospital.com', '1975-09-22', 2, TRUE),
('Dra. Ana Lima', 67890, 'ana@hospital.com', '1983-03-15', 3, TRUE),
('Dra. Maria Alves', 98765, 'maria@hospital.com', '1978-07-01', 4, TRUE),
('Dr. Pedro Ramos', 11223, 'pedro@hospital.com', '1990-11-30', 5, TRUE),
('Dr. Marcos Silva', 77889, 'marcos@hospital.com', '1974-04-12', 6, TRUE),
('Dra. Letícia Araújo', 88990, 'leticia@hospital.com', '1986-09-02', 7, TRUE),
('Dr. Fábio Torres', 99001, 'fabio@hospital.com', '1972-01-20', 8, TRUE),
('Dra. Renata Campos', 11122, 'renata@hospital.com', '1989-11-11', 9, TRUE),
('Dr. Gustavo Melo', 22233, 'gustavo@hospital.com', '1981-06-06', 1, TRUE),
('Dra. Paula Fernandes', 33344, 'paula@hospital.com', '1987-08-08', 2, TRUE),
('Dr. Leonardo Costa', 44455, 'leonardo@hospital.com', '1979-02-02', 3, TRUE);

-- ==================================================
-- 6. Inserção de Tipo de Quarto 
-- ==================================================
INSERT INTO Tipo_Quarto (descricao, valor_diaria) VALUES
('Apartamento', 350.00),
('Quarto Duplo', 250.00),
('Enfermaria', 150.00);

INSERT INTO Tipo_Quarto (descricao, valor_diaria) VALUES
('VIP', 400.00),
('Compartilhado', 100.00);
-- ==================================================
-- 7. Inserção de Quartos (mínimo 3)
-- ==================================================
INSERT INTO Quarto (numero, id_tipo_quarto) VALUES
('101A',1),
('102B',2),
('103C',3),
('104D',1),
('105E',2);

-- ==================================================
-- 8. Inserção de Enfermeiros (mínimo 10)
-- ==================================================
INSERT INTO Enfermeiro (nome, cpf, coren) VALUES
('Renata Lopes','12378945611','COREN1234'),
('Marcelo Dias','45612378922','COREN5678'),
('Patrícia Souza','78945612333','COREN9101'),
('Tiago Alves','32165498744','COREN1121'),
('Larissa Melo','65498732155','COREN3141'),
('Carla Nunes','98765432166','COREN5161'),
('Bruno Martins','15975348677','COREN7181'),
('Daniela Rocha','75315948688','COREN9202'),
('Marcos Silva','85296374199','COREN2223'),
('Aline Campos','96385274100','COREN4242');

-- ==================================================
-- 9. Inserção de Consultas (mínimo 20, algumas com receituário >=2 medicamentos)
-- Algumas consultas terão convênio e diferentes pacientes/médicos
-- ==================================================
INSERT INTO Consulta (data_hora, id_paciente, id_medico, id_convenio, valor) VALUES
('2016-01-15 09:00:00', 1, 1, 1, 300.00),
('2017-03-22 10:30:00', 2, 2, 2, 350.00),
('2018-06-05 14:00:00', 3, 3, 3, 400.00),
('2019-09-10 08:30:00', 4, 4, 4, 280.00),
('2020-12-12 16:00:00', 5, 5, 1, 320.00),
('2015-04-18 11:00:00', 6, 6, 2, 300.00),
('2016-07-20 13:30:00', 7, 7, 3, 450.00),
('2017-10-11 15:00:00', 8, 8, 4, 380.00),
('2018-11-22 09:45:00', 9, 9, 1, 420.00),
('2019-05-30 10:15:00', 10, 10, 2, 310.00),
('2020-01-15 14:30:00', 11, 11, 3, 330.00),
('2021-03-25 11:45:00', 12, 12, 4, 360.00),
('2016-08-08 12:00:00', 13, 1, 1, 400.00),
('2017-12-12 09:30:00', 14, 2, 2, 370.00),
('2018-04-04 10:00:00', 15, 3, 3, 290.00),
('2019-09-09 15:30:00', 16, 4, 4, 310.00),
('2020-10-10 08:45:00', 17, 5, 1, 350.00),
('2021-06-06 13:15:00', 18, 6, 2, 300.00),
('2021-08-08 14:45:00', 19, 7, 3, 410.00),
('2021-12-12 10:30:00', 20, 8, 4, 390.00);

-- ==================================================
-- 10. Inserção de Internações (mínimo 7, 2 pacientes com >1 internação)
-- ==================================================

INSERT INTO Internacao (data_entrada, data_prev_alta, data_alta, procedimento, fk_quarto_id, fk_id_paciente, fk_id_medico) VALUES
('2016-03-15', '2016-03-20', '2016-03-19', 'Cirurgia de apêndice', 1, 1, 1),
('2017-06-10', '2017-06-15', '2017-06-14', 'Tratamento clínico', 2, 2, 2),
('2018-01-05', '2018-01-12', '2018-01-11', 'Observação médica', 3, 3, 3),
('2019-09-20', '2019-09-25', '2019-09-24', 'Cirurgia ortopédica', 1, 1, 1),  -- paciente 1 novamente
('2020-04-10', '2020-04-15', '2020-04-14', 'Exame de rotina', 2, 4, 4),
('2021-11-01', '2021-11-07', '2021-11-06', 'Tratamento de infecção', 3, 2, 2),   -- paciente 2 novamente
('2021-12-15', '2021-12-20', '2021-12-19', 'Observação clínica', 1, 5, 5),
('2021-08-05', '2021-08-12', '2021-08-11', 'Cirurgia oftalmológica', 4, 6, 6),
('2020-10-10', '2020-10-15', '2020-10-14', 'Internação clínica', 5, 7, 7);

-- ==================================================
-- 11. Associação Enfermeiro-Internação (mínimo 2 enfermeiros por internação)
-- ==================================================
INSERT INTO requer (fk_internacao_id, fk_enfermeiro_id) VALUES
(1,1),(1,2),
(2,3),(2,4),
(3,5),(3,6),
(4,7),(4,8),
(5,9),(5,10),
(6,1),(6,3),
(7,2),(7,4);

-- ==================================================
-- 12. Associação Medico-Especialidade (cada medico tem ao menos uma especialidade, especifando a data de inicio da mesma)
-- ==================================================

INSERT INTO Tem (fk_medico_id, fk_especialidade_id, data_inicio) VALUES
(1, 1, '2010-01-01'),
(2, 2, '2012-06-15'),
(3, 3, '2015-03-10'),
(4, 4, '2018-07-20'),
(5, 5, '2019-01-01'),
(6, 1, '2020-02-05'),
(7, 3, '2021-05-18'),
(8, 2, '2016-09-12'),
(9, 4, '2017-11-23'),
(10, 5, '2022-01-01');

-- ==================================================
-- 13. Inserção de Remedio 
-- Armazena os medicamentos com nome, tipo, composição e quantidade por embalagem. 
-- Usada nas prescrições das receitas médicas.
-- ==================================================

-- ==================================================
-- 13. Inserção de Remédio (tipos variados e quantidades de embalagem)
-- ==================================================

INSERT INTO Remedio (nome_remedio, tipo_remedio, descricao_composicao, quantidade_embalagem) VALUES
('Paracetamol', 'Comprimido', 'Paracetamol 500mg', '20 comprimidos'),
('Ibuprofeno', 'Comprimido', 'Ibuprofeno 400mg', '10 comprimidos'),
('Omeprazol', 'Cápsula', 'Omeprazol 20mg', '14 cápsulas'),
('Amoxicilina', 'Cápsula', 'Amoxicilina 500mg', '21 cápsulas'),
('Losartana', 'Comprimido', 'Losartana 50mg', '30 comprimidos'),
('Dipirona', 'Xarope', 'Dipirona sódica 500mg/ml', '100 ml'),
('Lorazepam', 'Comprimido', 'Lorazepam 2mg', '20 comprimidos'),
('Cetirizina', 'Gotas', 'Cetirizina 10mg/ml', '15 ml'),
('Clorfenamina', 'Xarope', 'Clorfenamina maleato 2mg/5ml', '120 ml'),
('Metformina', 'Comprimido', 'Metformina 500mg', '30 comprimidos'),
('Simvastatina', 'Comprimido', 'Simvastatina 20mg', '28 comprimidos'),
('Ranitidina', 'Comprimido', 'Ranitidina 150mg', '20 comprimidos'),
('Azitromicina', 'Pó para suspensão', 'Azitromicina 500mg/5ml após diluição', '30 ml'),
('Prednisona', 'Comprimido', 'Prednisona 20mg', '10 comprimidos'),
('Enalapril', 'Comprimido', 'Enalapril 10mg', '30 comprimidos'),
('Furosemida', 'Comprimido', 'Furosemida 40mg', '20 comprimidos'),
('Amoxicilina + Clavulanato', 'Suspensão oral', 'Amoxicilina 400mg + Clavulanato 57mg/5ml', '70 ml'),
('Cetoconazol', 'Creme', 'Cetoconazol 2%', '30 g'),
('Dexametasona', 'Injetável', 'Dexametasona 4mg/ml', '5 ampolas de 2ml'),
('Clopidogrel', 'Comprimido', 'Clopidogrel 75mg', '30 comprimidos'),
('Nistatina', 'Pomada', 'Nistatina 100.000 UI/g', '30 g'),
('Budesonida', 'Spray nasal', 'Budesonida 64mcg/dose', '120 doses'),
('Soro fisiológico', 'Solução nasal', 'Cloreto de sódio 0,9%', '250 ml'),
('Adrenalina', 'Injetável', 'Adrenalina 1mg/ml', '10 ampolas de 1ml'),
('Omcilon-A Orabase', 'Pomada oral', 'Triancinolona acetonida 0,1%', '5 g');





-- ==================================================
-- 14. Inserção de Receita 
-- Registra as receitas emitidas por médicos durante consultas. 
-- Cada consulta pode ter uma ou mais receitas ligadas a um paciente.
-- ==================================================


-- Consulta 1 tem 2 receitas
INSERT INTO Receita (id_consulta, quantidade_remedio, observacao, status) VALUES
(1, 2, 'Tomar conforme prescrição', 'emitida'),
(1, 1, 'Tomar em jejum', 'emitida'),

-- Consulta 2 tem 1 receita
(2, 1, 'Tomar antes das refeições', 'emitida'),

-- Consulta 3 tem 2 receitas
(3, 3, 'Tomar durante o dia', 'emitida'),
(3, 1, 'Tomar à noite', 'emitida'),

-- Consulta 4 tem 1 receita
(4, 2, 'Tomar à noite', 'emitida'),

-- Consulta 5 tem 1 receita
(5, 1, 'Tomar de manhã', 'emitida'),

-- Consulta 6 tem 2 receitas
(6, 2, 'Tomar 1 comprimido a cada 8h', 'emitida'),
(6, 1, 'Tomar após o almoço', 'emitida'),

-- Consulta 7 tem 1 receita
(7, 1, 'Tomar em jejum', 'emitida'),

-- Consulta 8 tem 2 receitas
(8, 3, 'Tomar conforme orientação médica', 'emitida'),
(8, 2, 'Tomar à noite', 'emitida'),

-- Consulta 9 tem 1 receita
(9, 2, 'Tomar 1 cápsula ao dia', 'emitida'),

-- Consulta 10 tem 1 receita
(10, 1, 'Tomar antes de dormir', 'emitida'),

-- Consulta 11 tem 2 receitas
(11, 2, 'Tomar de manhã e à noite', 'emitida'),
(11, 1, 'Tomar à noite', 'emitida'),

-- Consulta 12 tem 1 receita
(12, 1, 'Tomar em jejum', 'emitida'),

-- Consulta 13 tem 1 receita
(13, 2, 'Tomar após almoço', 'emitida'),

-- Consulta 14 tem 2 receitas
(14, 3, 'Tomar de manhã e à noite', 'emitida'),
(14, 1, 'Tomar à noite', 'emitida'),

-- Consulta 15 tem 1 receita
(15, 1, 'Tomar de manhã', 'emitida'),

-- Consulta 16 tem 2 receitas
(16, 2, 'Tomar antes do almoço', 'emitida'),
(16, 1, 'Tomar à noite', 'emitida'),

-- Consulta 17 tem 1 receita
(17, 1, 'Tomar em jejum', 'emitida'),

-- Consulta 18 tem 1 receita
(18, 2, 'Tomar à noite', 'emitida'),

-- Consulta 19 tem 2 receitas
(19, 3, 'Tomar 1 cápsula 3x ao dia', 'emitida'),
(19, 1, 'Tomar antes das refeições', 'emitida'),

-- Consulta 20 tem 1 receita
(20, 2, 'Tomar 2 comprimidos à noite', 'emitida');

-- Receita 1 (Consulta 1)
INSERT INTO Prescreve (fk_receita_id, fk_remedio_id, quantidade, instrucao_de_uso) VALUES
(1, 1, 2, 'Tomar 1 comprimido a cada 8h'),
(1, 2, 1, 'Tomar após as refeições'),

-- Receita 2 (Consulta 1)
(2, 3, 1, 'Tomar em jejum'),
(2, 4, 1, 'Tomar 1 cápsula a cada 12h'),

-- Receita 3 (Consulta 2)
(3, 5, 1, 'Tomar 1 comprimido por dia'),

-- Receita 4 (Consulta 3)
(4, 6, 2, 'Tomar à noite'),
(4, 7, 1, 'Tomar de manhã'),

-- Receita 5 (Consulta 3)
(5, 8, 1, 'Tomar 2x ao dia'),

-- Receita 6 (Consulta 4)
(6, 9, 1, 'Tomar em jejum'),

-- Receita 7 (Consulta 5)
(7, 10, 3, 'Tomar 3x ao dia'),

-- Receita 8 (Consulta 6)
(8, 11, 1, 'Tomar de manhã'),
(8, 12, 2, 'Tomar à noite'),

-- Receita 9 (Consulta 6)
(9, 13, 1, 'Tomar conforme orientação médica'),

-- Receita 10 (Consulta 7)
(10, 14, 1, 'Tomar antes de dormir'),

-- Receita 11 (Consulta 8)
(11, 15, 2, 'Tomar de manhã e à noite'),
(11, 16, 1, 'Tomar à noite'),

-- Receita 12 (Consulta 9)
(12, 17, 1, 'Tomar em jejum'),

-- Receita 13 (Consulta 10)
(13, 18, 2, 'Tomar após almoço'),

-- Receita 14 (Consulta 11)
(14, 19, 1, 'Tomar de manhã'),
(14, 20, 1, 'Tomar à noite'),

-- Receita 15 (Consulta 12)
(15, 1, 1, 'Tomar à noite'),

-- Receita 16 (Consulta 13)
(16, 2, 1, 'Tomar conforme prescrição'),

-- Receita 17 (Consulta 14)
(17, 3, 2, 'Tomar antes do almoço'),
(17, 4, 1, 'Tomar à noite'),

-- Receita 18 (Consulta 15)
(18, 5, 1, 'Tomar de manhã'),

-- Receita 19 (Consulta 16)
(19, 6, 1, 'Tomar em jejum'),
(19, 7, 2, 'Tomar à noite'),

-- Receita 20 (Consulta 17)
(20, 8, 1, 'Tomar à noite'),

-- Receita 21 (Consulta 18)
(21, 9, 2, 'Tomar à noite'),

-- Receita 22 (Consulta 19)
(22, 10, 1, 'Tomar 1 cápsula 3x ao dia'),
(22, 11, 1, 'Tomar antes das refeições'),

-- Receita 23 (Consulta 19)
(23, 12, 1, 'Tomar à noite'),

-- Receita 24 (Consulta 20)
(24, 13, 2, 'Tomar 2 comprimidos à noite');

SELECT * FROM Endereco;
SELECT * FROM Especialidade;
SELECT * FROM Medico;
SELECT * FROM Paciente;
SELECT * FROM Convenio;
SELECT * FROM Tipo_Quarto;
SELECT * FROM Quarto;
SELECT * FROM Enfermeiro;
SELECT * FROM Remedio;
SELECT * FROM Receita;
SELECT * FROM Consulta;
SELECT * FROM Internacao;

-- RELACIONAMENTOS
SELECT * FROM Tem;          -- médico ↔ especialidade
SELECT * FROM Requer; 
 SELECT * FROM prescreve;
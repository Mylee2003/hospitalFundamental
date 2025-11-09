-- ==========================================================
-- PARTE 5 - Consultas SQL
-- Projeto: Banco de Dados Hospital
-- Descrição: Consultas  com base nas tabelas já criadas
-- ==========================================================

USE hospital;

-- ==========================================================
-- 🔹 INSERÇÕES DE TESTE PARA CONSULTA 
-- ==========================================================
--  Médicos que possuem "Gabriel" no nome
ALTER TABLE Medico
MODIFY COLUMN crm VARCHAR(20);
INSERT INTO Medico (nome, crm, id_especialidade) VALUES
('Dr. Gabriel Mendes', '223344-SP', 1),
('Dr. João Gabriel Almeida', '445566-RJ', 3),
('Dr. Gabriel Sanches', '998877-SP',5) ;

-- --  internações feita por médico gastroenterologista em enfermaria

INSERT INTO Internacao 
(fk_id_paciente, fk_id_medico, fk_quarto_id, data_entrada, data_alta, procedimento)
VALUES
(5, 5, 3, '2025-10-01', '2025-10-05', 'Endoscopia digestiva alta'),
(8, 5, 3, '2025-10-15', '2025-10-18', 'Exame de colonoscopia'),
(7, 15, 3, '2025-10-10', '2025-10-13', 'Tratamento de refluxo gastroesofágico');

select * from especialidade;
select * from medico;
select * from internacao;
select * from quarto;
select * from tipo_quarto;

-- Consultas realizadas sem convênio (id_convenio = NULL)
INSERT INTO consulta (data_hora, id_paciente, id_medico, id_convenio, valor)
VALUES
('2025-08-10 09:00:00', 1, 2, NULL, 200.00),
('2025-08-12 14:30:00', 3, 1, NULL, 350.00),
('2025-08-14 10:15:00', 4, 5, NULL, 280.00);


-- Internações em que o paciente teve alta depois da data prevista
INSERT INTO Internacao (data_entrada, data_prev_alta, data_alta, procedimento, fk_id_paciente, fk_id_medico, fk_quarto_id)
VALUES
('2025-07-01 10:00:00', '2025-07-05 10:00:00', '2025-07-07 15:00:00', 'Cirurgia abdominal', 1, 2, 3),
('2025-08-10 08:00:00', '2025-08-13 09:00:00', '2025-08-15 11:30:00', 'Tratamento intestinal', 2, 4, 2),
('2025-09-02 14:00:00', '2025-09-06 14:00:00', '2025-09-09 10:00:00', 'Observação pós-operatória', 3, 5, 1);

-- ==========================================================
-- 1 Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
-- 
-- ==========================================================
SELECT *
FROM Consulta
WHERE YEAR(data_hora) = 2020 and id_convenio IS NOT NULL;


SELECT 
    format(AVG(valor),2) AS media_valor_2020
FROM Consulta
WHERE YEAR(data_hora) = 2020 and id_convenio IS NOT NULL;

-- ==========================================================
-- 2 Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
-- ==========================================================
SELECT *
FROM Internacao
WHERE data_alta > data_prev_alta;

-- ==========================================================
-- 3 Receituário completo da primeira consulta registrada com receituário associado.
-- ==========================================================
SELECT r.*
FROM Receita r
JOIN Consulta c ON r.id_consulta = c.id_consulta
ORDER BY c.data_hora ASC
LIMIT 1;

-- ==========================================================
-- 4️ Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
-- ==========================================================
SELECT *
FROM Consulta
WHERE id_convenio IS NULL
ORDER BY valor DESC 
LIMIT 1;

SELECT *
FROM Consulta
WHERE id_convenio IS NULL
ORDER BY valor ASC
LIMIT 1;

-- ==========================================================
-- 5️ Todos os dados das internações em seus respectivos quartos, calculando o total da
-- internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
-- ==========================================================

SELECT 
    i.id_internacao,
    p.nome_paciente,
    q.numero,
    tq.descricao,
    tq.valor_diaria,
    i.data_entrada,
    i.data_alta,
    DATEDIFF(i.data_alta, i.data_entrada) AS dias_internado,
    ROUND(DATEDIFF(i.data_alta, i.data_entrada) * tq.valor_diaria, 2) AS total_internacao
FROM Internacao i
JOIN Paciente p ON i.fk_id_paciente = p.id_paciente
JOIN Quarto q ON i.fk_quarto_id = q.id_quarto
JOIN Tipo_Quarto tq ON q.id_tipo_quarto = tq.id_tipo_quarto;


-- ==========================================================
-- 6 Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
-- ==========================================================
SELECT 
    i.data_entrada,
    i.procedimento,
    q.numero,
    tp.descricao
FROM Internacao i
JOIN Quarto q ON i.fk_quarto_id = q.id_quarto
join tipo_quarto tp on q.id_tipo_quarto = tp.id_tipo_quarto
WHERE tp.descricao = 'apartamento';

-- ==========================================================
-- 7 Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade 
-- não seja “pediatria”, ordenando por data de realização da consulta.
-- ==========================================================
SELECT 
    p.nome_paciente,
    c.data_hora,
    m.nome as medico,
    e.nome_especialidade
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico
join especialidade e on m.id_especialidade = e.id_especialidade
WHERE TIMESTAMPDIFF(YEAR, p.data_nasc, c.data_hora) < 18
  AND  e.nome_especialidade <> 'pediatria'
ORDER BY c.data_hora;

-- ==========================================================
-- 8️ Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas
-- por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
-- ==========================================================
SELECT 
    p.nome_paciente,
    m.nome AS medico,
    e.nome_especialidade,
    i.data_entrada,
    i.procedimento,tq.descricao
    
FROM Internacao i
JOIN Paciente p ON i.fk_id_paciente = p.id_paciente
JOIN Medico m ON i.fk_id_medico = m.id_medico
JOIN Quarto q ON i.fk_quarto_id = q.id_quarto
join tipo_quarto tq on q.id_tipo_quarto = tq.id_tipo_quarto
join especialidade e on m.id_especialidade = e.id_especialidade
WHERE e.nome_especialidade = 'Gastroenterologia'
  AND tq.descricao = 'Enfermaria';

-- ==========================================================
-- 9️ Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
-- ==========================================================
SELECT 
    m.nome AS medico,
    m.crm,
    COUNT(c.id_consulta) AS total_consultas
FROM Medico m
LEFT JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.id_medico, m.nome, m.crm
ORDER BY total_consultas DESC;

-- ==========================================================
-- 10 Médicos com "Gabriel" no nome
-- ==========================================================
SELECT *
FROM Medico
WHERE nome LIKE '%Gabriel%';

-- ==========================================================
-- 1️1 Os nomes, CREs e número de internações de enfermeiros
-- que participaram de mais de uma internação.
-- ==========================================================
SELECT 
    en.nome AS enfermeiro,
    en.coren,
    COUNT(i.id_internacao) AS total_internacoes
FROM Enfermeiro en
JOIN Internacao i ON en.id_enfermeiro = i.fk_id_enfermeiro
GROUP BY e.id_enfermeiro, e.nome, e.coren
HAVING COUNT(i.id_internacao) > 1;

-- ==========================================================
-- ==========================================================

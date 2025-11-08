

-- ==========================================================
-- ALTERAÇÃO: Adicionar coluna 'em_atividade' na tabela Medico
-- ==========================================================

use hospital;
ALTER TABLE Medico
ADD COLUMN em_atividade BOOLEAN DEFAULT TRUE;

-- ==========================================================
-- ATUALIZAÇÃO: Definir médicos ativos e inativos
-- ==========================================================
-- Dois médicos serão marcados como inativos (FALSE),
-- e os demais continuarão em atividade (TRUE).

UPDATE Medico
SET em_atividade = FALSE
WHERE id_medico IN (2, 4);

UPDATE Medico
SET em_atividade = TRUE
WHERE id_medico NOT IN (2, 4);

-- ==========================================================
-- CONSULTA DE VERIFICAÇÃO
-- ==========================================================
-- Exibe todos os médicos com o status atualizado

SELECT id_medico, nome, crm, em_atividade
FROM Medico;

-- PROJETO: SISTEMA DE SOLICITAÇÕES DE MANUTENÇÃO
-- Banco de dados: MySQL

-- 1. CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS sistema_manutencao;

USE sistema_manutencao;

-- 2. CRIAÇÃO DA TABELA DE EQUIPAMENTOS
CREATE TABLE equipamentos (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    identificacao VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    placa_patrimonio VARCHAR(50)
);

-- 3. CRIAÇÃO DA TABELA DE SOLICITAÇÕES
CREATE TABLE solicitacoes (
    id_solicitacao INT AUTO_INCREMENT PRIMARY KEY,
    id_equipamento INT NOT NULL,
    descricao TEXT NOT NULL,
    data_abertura DATE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Aberta',

    FOREIGN KEY (id_equipamento)
        REFERENCES equipamentos(id_equipamento)
);

-- 4. INSERÇÃO DE EQUIPAMENTOS
INSERT INTO equipamentos
    (identificacao, tipo, placa_patrimonio)
VALUES
    ('Retroescavadeira', 'Máquina', 'PAT-001'),
    ('Caminhão basculante', 'Veículo', 'ABC-1234'),
    ('Motoniveladora', 'Máquina', 'PAT-002');

-- 5. INSERÇÃO DE SOLICITAÇÕES
INSERT INTO solicitacoes
    (id_equipamento, descricao, data_abertura, status)
VALUES
    (1, 'Problema no sistema hidráulico', '2026-10-20', 'Aberta'),
    (2, 'Falha no sistema de freios', '2026-10-21', 'Em andamento'),
    (3, 'Revisão do motor', '2026-10-22', 'Concluída');

-- 6. CONSULTA DAS SOLICITAÇÕES
SELECT
    s.id_solicitacao,
    e.identificacao AS equipamento,
    s.descricao,
    s.data_abertura,
    s.status
FROM solicitacoes s
INNER JOIN equipamentos e
    ON s.id_equipamento = e.id_equipamento;

-- 7. ATUALIZAÇÃO DE UMA SOLICITAÇÃO
UPDATE solicitacoes
SET status = 'Em andamento'
WHERE id_solicitacao = 1;

-- 8. EXCLUSÃO DE UMA SOLICITAÇÃO
DELETE FROM solicitacoes
WHERE id_solicitacao = 3;

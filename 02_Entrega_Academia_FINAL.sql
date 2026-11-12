-- SEGUNDA ENTREGA - PROJETO BANCO DE DADOS ACADEMIA
-- MySQL 8.0 | Script para instalacao em um banco NOVO / VAZIO.
-- IMPORTANTE: nao execute este script no banco academia ja preenchido.
-- Os INSERTs nao sao idempotentes e podem duplicar dados.
-- Executar com conta administrativa (ex.: root) no MySQL Workbench.
-- Usuarios e senhas sao configurados separadamente, fora do GitHub.

CREATE DATABASE IF NOT EXISTS academia;
USE academia;

-- 1. ESTRUTURA E DADOS
CREATE TABLE IF NOT EXISTS Plano(
    idPlano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    duracao VARCHAR(45),
    planocol INT NOT NULL
);


CREATE TABLE IF NOT EXISTS Aluno(
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
    dataNascimento DATE NOT NULL,
    telefone VARCHAR(15),
    idPlano INT NOT NULL,
    FOREIGN KEY (idPlano) REFERENCES Plano(idPlano)
);


CREATE TABLE IF NOT EXISTS Ficha_treino(
    idFicha INT AUTO_INCREMENT PRIMARY KEY,
    dataCriacao DATE NOT NULL,
    objetivo VARCHAR(100),
    idAluno INT NOT NULL UNIQUE,
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno)
);


CREATE TABLE IF NOT EXISTS Professor(
    idProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    especialidade VARCHAR(45) NOT NULL,
    idSupervisor INT,
    FOREIGN KEY (idSupervisor) REFERENCES Professor(idProfessor)
);

CREATE TABLE IF NOT EXISTS Treino(
    idTreino INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(100),
    idProfessor INT NOT NULL,
    FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor)
);

CREATE TABLE IF NOT EXISTS Exercicio(
    idExercicio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    grupoMuscular VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Treino_exercicio(
    idTreino INT,
    idExercicio INT,
    series INT,
    repeticoes INT,
    PRIMARY KEY (idTreino, idExercicio),
    FOREIGN KEY (idTreino) REFERENCES Treino(idTreino),
    FOREIGN KEY (idExercicio) REFERENCES Exercicio(idExercicio)
);

-- INSERT TABELA PLANO
INSERT INTO Plano (nome, valor, duracao, planocol) VALUES ('Mensal', 99.90, '1 mes', 1);
INSERT INTO Plano (nome, valor, duracao, planocol) VALUES ('Anual', 850.00, '1 ano', 2);
INSERT INTO Plano (nome, valor, duracao, planocol) VALUES ('Bimestral', 180.00, '2 meses', 3);
INSERT INTO Plano (nome, valor, duracao, planocol) VALUES ('Trimestral', 280.00, '3 meses', 4);
INSERT INTO Plano (nome, valor, duracao, planocol) VALUES ('Semestral', 5000.00, '6 meses', 5);

-- INSERT TABELA ALUNO
INSERT INTO Aluno (idAluno, nome, cpf, dataNascimento, telefone, idPlano) VALUES (1, 'Felipe Loschi', '123.456.789-00', '2004-05-15', '(35) 99999-1234', 1);
INSERT INTO Aluno (idAluno, nome, cpf, dataNascimento, telefone, idPlano) VALUES (3, 'Pedro Henrique', '127.466.719-80', '2003-10-15', '(35) 97899-1534', 3);
INSERT INTO Aluno (idAluno, nome, cpf, dataNascimento, telefone, idPlano) VALUES (4, 'Felipe Souza', '123.456.789-00', '2005-08-15', '(35) 99569-1434', 1);
INSERT INTO Aluno (idAluno, nome, cpf, dataNascimento, telefone, idPlano) VALUES (5, 'Felipe Silva', '745.840.381-27', '2006-12-15', '(35) 99729-1734', 5);
INSERT INTO Aluno (idAluno, nome, cpf, dataNascimento, telefone, idPlano) VALUES (6, 'João Pedro', '123.456.789-00', '2001-05-09', '(35) 98745-2459', 4);

-- INSERT TABELA FICHA TREINO
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2026-11-10', 'Hipertrofia', 1);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2022-08-15', 'Ganho de Forca', 3);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2023-05-18', 'Hipertrofia', 4);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2022-01-10', 'Reabilitacao', 5);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2026-11-12', 'Condicionamento Fisico', 6);

-- INSERT TABELA PROFESSOR
INSERT INTO Professor (nome, cpf, especialidade, idSupervisor) VALUES ('Rodrigo Silva', '987.654.321-00', 'Musculacao', NULL);
INSERT INTO Professor (nome, cpf, especialidade, idSupervisor) VALUES ('Carlos Simao', '917.624.331-80', 'Emagrecimento', 1);
INSERT INTO Professor (nome, cpf, especialidade, idSupervisor) VALUES ('Mendonca Lima', '787.614.371-70', 'Ganho de Forca', 1);
INSERT INTO Professor (nome, cpf, especialidade, idSupervisor) VALUES ('Eduardo Ruiz', '887.684.322-10', 'Hipertrofia', 1);
INSERT INTO Professor (nome, cpf, especialidade, idSupervisor) VALUES ('Pablo Emilio', '977.654.330-20', 'Reabilitacao', 1);

-- INSERT TABELA TREINO
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino A', 'Peito e Triceps', 1);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino B', 'Costas e Triceps', 1);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino C', 'Cardio', 1);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino D', 'Pernas', 1);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino A', 'Peito e Triceps', 2);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino B', 'Costas e Triceps', 3);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino A', 'Peito e Triceps', 4);
INSERT INTO Treino (nome, descricao, idProfessor) VALUES ('Treino D', 'Pernas', 5);


-- INSERT TABELA EXERCICIO
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Supino reto', 'Peito');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Supino Inclinado', 'Peito');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Puxada Frontal', 'Costas');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Remada Baixa', 'Costas');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Agachamento Livre', 'Pernas');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Leg Press', 'Pernas');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Rosca Direta', 'Biceps');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Rosca Materlo', 'Biceps');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Triceps pulley', 'Triceps');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Triceps testa', 'Triceps');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Esteira', 'Cardio');
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Bicicleta', 'Cardio');

-- INSERT TABELA Treino_Exercicio
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (1, 1, 4, 12);
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (1, 3, 3, 15);
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (4, 5, 3, 15);
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (3, 11, 1, 100);
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (2, 4, 3, 12);

-- 2. DML: atualizacoes realizadas durante a segunda entrega.
-- Os dados iniciais ja representam a situacao apos o cancelamento do aluno ID 2.
-- Nao ha aluno ID 2 nem ficha vinculada a ele; por isso nao ha DELETE destrutivo aqui.
UPDATE Aluno SET telefone = '(35) 99569-7239' WHERE idAluno = 5;
UPDATE Exercicio SET nome = 'Rosca Concentrada' WHERE idExercicio = 8;

-- 3. VIEWS
CREATE OR REPLACE VIEW View_Alunos_Planos AS
SELECT a.idAluno, a.nome AS nome_aluno, p.nome AS nome_plano, p.valor AS valor_plano
FROM Aluno a INNER JOIN Plano p ON a.idPlano = p.idPlano;

CREATE OR REPLACE VIEW View_Treinos_Professores AS
SELECT t.idTreino, t.nome AS nome_treino, t.descricao AS descricao_treino,
       p.nome AS nome_professor, p.especialidade
FROM Treino t INNER JOIN Professor p ON t.idProfessor = p.idProfessor;

CREATE OR REPLACE VIEW View_Alunos_Fichas AS
SELECT a.idAluno, a.nome AS nome_aluno, f.idFicha, f.dataCriacao, f.objetivo
FROM Aluno a INNER JOIN Ficha_treino f ON a.idAluno = f.idAluno;

CREATE OR REPLACE VIEW View_Exercicios_Treinos AS
SELECT t.idTreino, t.nome AS nome_treino, e.nome AS nome_exercicio,
       e.grupoMuscular, te.series, te.repeticoes
FROM Treino_exercicio te
INNER JOIN Treino t ON te.idTreino = t.idTreino
INNER JOIN Exercicio e ON te.idExercicio = e.idExercicio;

-- 4. PROCEDURES
DELIMITER $$
CREATE PROCEDURE Cancelar_Matricula(IN p_idAluno INT)
BEGIN
    DELETE FROM Ficha_treino WHERE idAluno = p_idAluno;
    DELETE FROM Aluno WHERE idAluno = p_idAluno;
END $$

CREATE PROCEDURE Promover_Professor(IN p_idProfessor INT)
BEGIN
    UPDATE Professor SET idSupervisor = NULL WHERE idProfessor = p_idProfessor;
END $$

-- 5. FUNCTIONS
CREATE FUNCTION Contar_Alunos()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Aluno;
    RETURN total;
END $$

CREATE FUNCTION Calcular_Valor_Anual_Plano(p_idPlano INT, p_valorPlano DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_ano DECIMAL(10,2);
    CASE p_idPlano
        WHEN 1 THEN SET total_ano = p_valorPlano * 12;
        WHEN 2 THEN SET total_ano = p_valorPlano;
        WHEN 3 THEN SET total_ano = p_valorPlano * 6;
        WHEN 4 THEN SET total_ano = p_valorPlano * 4;
        WHEN 5 THEN SET total_ano = p_valorPlano * 2;
        ELSE SET total_ano = NULL;
    END CASE;
    RETURN total_ano;
END $$

-- 6. TRIGGER
CREATE TRIGGER Impedir_Exclusao_Aluno
BEFORE DELETE ON Aluno
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Ficha_treino WHERE idAluno = OLD.idAluno) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nao e permitido excluir aluno com ficha de treino';
    END IF;
END $$
DELIMITER ;

-- 7. ROLES E PERMISSOES
CREATE ROLE IF NOT EXISTS 'Professor'@'%', 'Supervisor'@'%';
GRANT SELECT, INSERT, UPDATE ON academia.Treino TO 'Professor'@'%';
GRANT SELECT, INSERT, UPDATE ON academia.Exercicio TO 'Professor'@'%';
GRANT SELECT, INSERT, UPDATE ON academia.Treino_exercicio TO 'Professor'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON academia.* TO 'Supervisor'@'%';

-- Criar usuarios manualmente com senhas privadas, nao publicar senhas no GitHub.
-- Apos criar 'rodrigo'@'localhost' e 'carlos'@'localhost', executar:
-- GRANT 'Supervisor'@'%' TO 'rodrigo'@'localhost';
-- GRANT 'Professor'@'%' TO 'carlos'@'localhost';
-- SET DEFAULT ROLE 'Supervisor'@'%' TO 'rodrigo'@'localhost';
-- SET DEFAULT ROLE 'Professor'@'%' TO 'carlos'@'localhost';

-- 8. CONSULTAS DE VERIFICACAO (nao alteram dados)
SELECT 'Plano' AS tabela, COUNT(*) AS total FROM Plano
UNION ALL SELECT 'Aluno', COUNT(*) FROM Aluno
UNION ALL SELECT 'Ficha_treino', COUNT(*) FROM Ficha_treino
UNION ALL SELECT 'Professor', COUNT(*) FROM Professor
UNION ALL SELECT 'Treino', COUNT(*) FROM Treino
UNION ALL SELECT 'Exercicio', COUNT(*) FROM Exercicio
UNION ALL SELECT 'Treino_exercicio', COUNT(*) FROM Treino_exercicio;
SELECT Contar_Alunos() AS total_alunos;
SELECT * FROM View_Alunos_Planos;
SELECT * FROM View_Treinos_Professores;
SELECT * FROM View_Alunos_Fichas;
SELECT * FROM View_Exercicios_Treinos;

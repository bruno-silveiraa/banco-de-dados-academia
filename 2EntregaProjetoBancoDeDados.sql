DROP DATABASE IF EXISTS Academia;
CREATE DATABASE Academia;
USE Academia;

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
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('Felipe Loschi', '123.456.789-00', '2004-05-15', '(35) 99999-1234', 1);
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('Felipe Lamy', '127.856.749-00', '2002-07-15', '(35) 99541-5689', 2);
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('Pedro Henrique', '127.466.719-80', '2003-10-15', '(35) 97899-1534', 3);
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('Felipe Souza', '123.456.789-00', '2005-08-15', '(35) 99569-1434', 1);
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('Felipe Silva', '745.840.381-27', '2006-12-15', '(35) 99729-1734', 5);
INSERT INTO Aluno (nome, cpf, dataNascimento, telefone, idPlano) VALUES ('João Pedro', '123.456.789-00', '2001-05-09', '(35) 98745-2459', 4);

-- INSERT TABELA FICHA TREINO
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2026-11-10', 'Hipertrofia', 1);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2020-11-10', 'Emagrecimento', 2);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2022-08-15', 'Ganho de Forca', 3);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2023-05-18', 'Hipertrofia', 4);
INSERT INTO Ficha_treino (dataCriacao, objetivo, idAluno) VALUES ('2022-01-10', 'Reabilitacao', 5);

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
INSERT INTO Exercicio (nome, grupoMuscular) VALUES ('Puxada Frontal', 'Costas ');
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
INSERT INTO Treino_exercicio (idTreino, idExercicio, series, repeticoes) VALUES (1, 1, 4, 12);

-- DML
UPDATE Aluno SET telefone = '(35) 99569-7239' WHERE idAluno = 5; -- Aluno mudou de telefone
UPDATE Exercicio SET nome = 'Rosca Concentrada' WHERE idExercicio = 8; -- Troca de exercicio disponivel
DELETE FROM Aluno WHERE idAluno = 2; -- Aluno cancelou matricula

-- Role 
CREATE ROLE 'Professor', 'Supervisor';

GRANT SELECT, INSERT, UPDATE ON bd.Treino TO 'Professor';
GRANT SELECT, INSERT, UPDATE ON bd.Treino_exercicio TO 'Professor';
GRANT SELECT ON bd.Exercicio TO 'Professor';
GRANT SELECT ON bd.Aluno TO 'Professor';
GRANT SELECT, INSERT, UPDATE ON bd.Ficha_treino TO 'Professor';

GRANT ALL ON bd.Professor TO 'Supervisor';
GRANT ALL ON bd.Treino TO 'Supervisor';
GRANT ALL ON bd.Treino_exercicio TO 'Supervisor';

GRANT ALL ON bd.Exercicio TO 'Supervisor';
CREATE USER 'rodrigo'@'localhost' IDENTIFIED BY 'Senha@1509';

CREATE USER 'carlos'@'localhost' IDENTIFIED BY 'Senha@123';
GRANT 'Supervisor' TO 'rodrigo'@'localhost';
GRANT 'Professor' TO 'carlos'@'localhost';
SET DEFAULT ROLE ALL TO 'rodrigo'@'localhost', 'carlos'@'localhost';

-- Join e Views
CREATE VIEW Alunos_Com_Ficha AS
SELECT Aluno.nome, Ficha_treino.idFicha FROM Aluno INNER JOIN Ficha_treino ON Aluno.idAluno = Ficha_treino.idAluno;
SELECT * FROM Alunos_Con_Ficha;

CREATE VIEW Alunos_Sem_Ficha AS
SELECT Aluno.nome FROM Aluno LEFT JOIN Ficha_treino ON Aluno.idAluno = Ficha_treino.idAluno;
SELECT * FROM Alunos_Sem_Ficha;

CREATE VIEW Professor_Supervisor AS
SELECT Professor.nome, Professor.especialidade FROM Professor INNER JOIN Professor ON Professor.idSupervisor = NULL;
SELECT * FROM Professor_Supervisor;

CREATE VIEW Alunos_Com_Plano AS
SELECT Aluno.nome, Plano.nome FROM Aluno INNER JOIN Plano ON Aluno.idPlano = Plano.idPlano;
SELECT * FROM Alunos_Com_Plano;

CREATE VIEW View_Treinos as
SELECT Execicio.nome, Treino.objetivo from Exercicio INNER JOIN Treino_exercicio ON Exercicio.idExercicio = Treino_exercicio.idExercicio
INNER JOIN Treino on Treino.idTreino = Treino_exercicio.idTreino;
SELECT * FROM View_ Treinos

-- Procedures
DELIMITER $$
DROP PROCEDURE IF EXISTS Cancelar_Matricula$$
CREATE PROCEDURE Cancelar_Matricula(IN id INT)
BEGIN
DELETE FROM Aluno WHERE Aluno.Matricula = id;
SELECT 'Matrícula Cancelada com Sucesso!';
END$$
DELIMITER ;
CALL Cancelar_Matricula(1);

DELIMITER $$
DROP PROCEDURE IF EXISTS Promover_Professor$$
CREATE PROCEDURE Promover_Professor(IN id INT)
BEGIN
UPDATE Professor SET Professor.idSupervisor = NULL WHERE Professor.idProfessor = id;
SELECT 'Professor Promovido Para Supervisor';
END$$
DELIMITER ;
CALL Promover_Professor(3);

-- Triggers
CREATE TRIGGER Apagar_Ficha
BEFORE DELETE ON Aluno FOR EACH ROW
BEGIN
DELETE FROM Ficha_treino WHERE (Ficha_Treino.idAluno = Aluno.idAluno);
END;

-- Functions
DELIMITER $$
DROP FUNCTION IF EXISTS Calcular_Valor_Anual_Plano$$
CREATE FUNCTION Contar_Alunos(idPlano INT, valorPlano DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE Total_Ano FLOAT;

IF idPlano = 1 THEN
SET Total_Ano = (valorPlano * 12);
ELSEIF idPlano = 2 THEN
SET Total_Ano = valorPlano;
ELSEIF idPlano = 3 THEN
SET Total_Ano = (valorPlano * 6);
ELSEIF idPlano = 4 THEN
SET Total_Ano = (valorPlano * 4);
ELSEIF idPlano = 5 THEN
SET Total_Ano = (valorPlano * 2);
END IF;
RETURN Total_Ano;
END $$
DELIMITER ;
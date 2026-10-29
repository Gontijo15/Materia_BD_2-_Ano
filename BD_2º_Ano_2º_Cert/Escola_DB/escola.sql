PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS Aluno;
CREATE TABLE Aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    media REAL,
    CPF TEXT NOT NULL UNIQUE,
    id_turma INTEGER NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS Turma;
CREATE TABLE Turma (
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla TEXT NOT NULL,
    curso TEXT CHECK(curso IN ("Integrado", "Regular")),
    serie INTEGER NOT NULL
);

DROP TABLE IF EXISTS Professor;
CREATE TABLE Professor (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    matricula TEXT NOT NULL,
    disciplina TEXT NOT NULL
);

DROP TABLE IF EXISTS Aula;
CREATE TABLE Aula (
    id_aula INTEGER PRIMARY KEY AUTOINCREMENT,
    dia_da_semana TEXT,
    horario TEXT,
    id_turma TEXT NOT NULL,
    id_professor TEXT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

INSERT INTO Turma (sigla, curso, serie)
VALUES ('DS202', 'Integrado', 2),
('AD202', 'Regular', 2);

INSERT INTO Aluno (nome, telefone, CPF, id_turma)
VALUES ('Gaby', '(21) 99988-7766', '111.111.111-47', 1),
('Manu', '(21) 99999-9999', '111.222.333-44', 2),
('Ygor', '(21) 99999-1234', '111.999.222-88', 1),
('Alícia', '(21) 99999-9876', '123.456.789-22', 2);

INSERT INTO Professor (nome, matricula, disciplina)
VALUES ('Clécio', 'M123', 'BD'),
('Ygor', 'M789', 'LP'),
('Alane', 'M547', 'MF'),
('Zé', 'M080', 'F');

SELECT *
FROM Aluno;
UPDATE Aluno
SET telefone = '(21) 47479-4747',
nome = 'Manu Outro'
WHERE id_aluno = 2;

UPDATE Aluno
SET media = 0.0;

DELETE FROM Aluno
WHERE nome LIKE '%l%';

SELECT *
FROM Aluno;

SELECT *
FROM Turma;

SELECT Turma.sigla, COUNT(id_aluno) AS QTD_Alunos
FROM Turma
INNER JOIN Aluno
ON Aluno.id_turma = Turma.id_turma
GROUP BY Aluno.id_turma;

DELETE FROM Turma
WHERE id_turma = 2;

SELECT *
FROM Turma;

SELECT *
FROM Aluno;
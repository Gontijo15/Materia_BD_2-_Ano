PRAGMA foreing_keys = ON;
DROP TABLE IF EXISTS Aluno;
CREATE TABLE IF NOT EXISTS Aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    media REAL,
    CPF TEXT NOT NULL UNIQUE,
    id_turma INTEGER NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

DROP TABLE IF EXISTS Turma;
CREATE TABLE IF NOT EXISTS Turma (
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla TEXT NOT NULL,
    curso TEXT NOT NULL,
    serie INTEGER NOT NULL
);

INSERT INTO Turma (sigla, curso, serie)
VALUES ('DS202', 'Desenvolvimento de Sistemas', 2),
('AD202', 'Adiministração', 2);

INSERT INTO Aluno (nome, telefone, CPF, id_turma)
VALUES ('Gaby', '(21) 99988-7766', '111.111.111-47', 1),
('Manu', '(21) 99999-9999', '111.222.333-44', 2),
('Ygor', '(21) 99999-1234', '111.999.222-88', 1),
('Alícia', '(21) 99999-9876', '123.456.789-22', 2);

SELECT *
FROM Aluno;
UPDATE Aluno
SET telefone = '(21) 47479-4747',
nome = 'Manu Outro'
WHERE id_aluno = 2;

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
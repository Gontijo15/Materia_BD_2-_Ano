PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Aula;

DROP TABLE IF EXISTS Aluno;

DROP TABLE IF EXISTS Turma;

DROP TABLE IF EXISTS Professor;

CREATE TABLE Turma (
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla TEXT NOT NULL,
    curso TEXT CHECK(curso IN ("Integrado", "Regular")),
    serie INTEGER NOT NULL
);

CREATE TABLE Aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT,
    media REAL,
    CPF TEXT NOT NULL UNIQUE,
    matricula TEXT NOT NULL UNIQUE,
    id_turma INTEGER NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
    ON DELETE CASCADE
);

CREATE TABLE Professor (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    matricula TEXT NOT NULL,
    disciplina TEXT NOT NULL
);

CREATE TABLE Aula (
    id_aula INTEGER PRIMARY KEY AUTOINCREMENT,
    dia_da_semana TEXT,
    horario TEXT,
    id_turma INTEGER NOT NULL,
    id_professor INTEGER NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
    ON DELETE CASCADE
);

INSERT INTO Turma (sigla, curso, serie)
VALUES ('DS202', 'Integrado', 2),
('AD202', 'Integrado', 2),
('1203', 'Regular', 2),
('1102', 'Regular', 1),
('1302', 'Regular', 3);

INSERT INTO Aluno (nome, telefone, CPF, id_turma, matricula)
VALUES ('Gaby', '(21) 99988-7766', '111.111.111-47', 1, 'M022'),
('Manu', '(21) 99999-9999', '111.222.333-44', 2, 'M023'),
('Ygor', '(21) 99999-1234', '111.999.222-88', 5, 'M024'),
('Alícia', '(21) 99999-9876', '123.456.789-22', 2, 'M037'),
('Júlio', '(21) 56965-4262', '999.888.777-66', 1, 'M025'),
('Pedro Lucas', '(21) 67676-7676', '102.938.475-65', 1, 'M026'),
('Mirela', '(21) 87988-7766', '331.111.111-47', 3, 'M027'),
('Isadora', '(21) 96988-7766', '411.111.111-47', 1, 'M028'),
('Igor', '(21) 99588-7766', '158.111.111-47', 2, 'M029'),
('Renam', '(21) 94988-7766', '981.111.111-47', 1, 'M030'),
('Crystian', '(21) 93988-7766', '251.111.111-47', 2, 'M031'),
('Pedro henrique', '(21) 98958-7766', '961.111.111-47', 2, 'M032'), 
('Agatha wanderberg', '(21) 97938-7866', '771.111.111-47', 1, 'M033'),
('Gustavo', '(21) 92609-1422', '052.852.527-56', 3, 'M034'),
('Renam', '(21) 90472-5296', '929.853.146-06', 3, 'M035'),
('Renam', '(21) 96382-0842', '649.062.141-78', 3, 'M036');

INSERT INTO Professor (nome, matricula, disciplina)
VALUES ('Clécio', 'M123', 'BD'),
('Ygor', 'M789', 'LP'),
('Alane', 'M547', 'MF'),
('Zé', 'M080', 'F'),
('Judismar', 'M676', 'LP');

INSERT INTO Aula (dia_da_semana, horario, id_professor, id_turma)
VALUES ('Quinta-feira', '13:00', 1, 1),
('Quinta-feira', '13:50', 1, 1),
('Quinta-feira', '15:00', 2, 1),
('Quinta-feira', '15:50', 2, 1),
('Quinta-feira', '16:40', 3, 1),
('Quinta-feira', '17:30', 3, 1),

('Quinta-feira', '13:00', 3, 2),
('Quinta-feira', '13:50', 3, 2),
('Quinta-feira', '15:00', 1, 2),
('Quinta-feira', '15:50', 1, 2),
('Quinta-feira', '16:40', 2, 2),
('Quinta-feira', '17:30', 2, 2),

('Quinta-feira', '7:00', 4, 3),
('Quinta-feira', '7:50', 4, 3),
('Quinta-feira', '9:00', 4, 3),
('Quinta-feira', '9:50', 5, 3),
('Quinta-feira', '10:40', 5, 3),
('Quinta-feira', '11:30', 5, 3),

('Quinta-feira', '7:00', 2, 4),
('Quinta-feira', '7:50', 2, 4),
('Quinta-feira', '9:00', 5, 4),
('Quinta-feira', '9:50', 5, 4),
('Quinta-feira', '10:40', 1, 4),
('Quinta-feira', '11:30', 1, 4),

('Quinta-feira', '7:00', 1, 5),
('Quinta-feira', '7:50', 1, 5),
('Quinta-feira', '9:00', 4, 5),
('Quinta-feira', '9:50', 4, 5),
('Quinta-feira', '10:40', 4, 5),
('Quinta-feira', '11:30', 3, 5);
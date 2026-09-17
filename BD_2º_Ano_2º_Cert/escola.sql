/* A linha abaixo ativa a funcionalidade de chave estrangeira no SQLite */
PRAGMA foreign_keys = ON;

/* A combinação de DROP TABLE e CREATE TABLE abaixo permite 
   excluir a tabela Aluno, se ela já existir, e criá-la novamente */
DROP TABLE IF EXISTS Aluno;
CREATE TABLE Aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    media REAL,
    telefone TEXT,
    id_turma INTEGER NOT NULL,
    /* A linha abaixo indica que a coluna id_turma desta tabela é uma 
       chave estrangeira para a coluna id_turma da tabela Turma */
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma) 
    ON DELETE CASCADE -- Essa linha define que ao excluir uma turma, todos os alunos dela serão excluídos.
    /* Outras opções:
    ON DELETE SET NULL -- Indica que ao excluir uma turma, todos os alunos dela ficam sem turma.
    ON DELETE NO ACTION -- Indica que uma turma com alunos não poderá ser excluída.
    */
);

DROP TABLE IF EXISTS Turma;
CREATE TABLE Turma (
    id_turma INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla TEXT NOT NULL,
    curso TEXT CHECK(curso IN ('integrado', 'regular')), -- a restrição CHECK é usada aqui para limitar quais cursos que podem ser cadastrados.
    serie INTEGER NOT NULL
);

/* O comando INSERT INTO pode ser usado para inserir uma ou mais linhas de uma só vez na tabela */
INSERT INTO Turma (sigla, curso, serie)
VALUES ('DS202', 'integrado', 2),
('DS102', 'integrado', 1),
('DS302', 'integrado', 3),
('1201', 'regular', 2),
('1301', 'regular', 3);

/* Ao inserir um aluno, precisamos informar um id_turma que exista na tabela Turma */
INSERT INTO Aluno (nome, telefone, cpf, id_turma)
VALUES ('Gaby', '(21) 99999-9999', '111.111.111-11', 2);

INSERT INTO Aluno (nome,telefone, cpf, id_turma)
VALUES ('Manu','(21) 99999-9999', '111.111.111-12', 1),
        ('Alicia', '(21) 99999-9999', '111.111.111-13', 1),
        ('Igor', '(21) 99999-9999', '111.111.111-14', 2);

SELECT * FROM Aluno;

/* O comando UPDATE pode ser usado para alterar o valor de uma ou mais colunas em uma ou mais linhas */
UPDATE Aluno 
SET -- a clásula SET indica quais colunas terão os valores alterados.
    telefone =  '(21) 67676-6767',
    nome = 'Alicia Outro'
WHERE id_aluno = 3; -- a clásula WHERE indica em quais linhas o valor das colunas será alterado.

select * FROM Aluno;

select * FROM Aluno;
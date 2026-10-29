const express = require('express');
const path = require("path");
const sqlite3 = require("sqlite3").verbose();

const app = express();
const port = 8080;

// Middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

// Conexão com o banco de dados
const db = new sqlite3.Database("./escola.db");

// Rota com um parâmetro na URL
app.get('/users/:userId', (req, res) => {
  res.send(`Perfil do usuario de ID: ${req.params.userId}`);
});

// Rota com vários parâmetros na URL
app.get('/users/:userId/posts/:postId', (req, res) => {
  res.send(`
    <h2>Informação do Usuário e do Post</h2>
    <p>User ID: ${req.params.userId}</p>
    <p>Post ID: ${req.params.postId}</p>
  `);
});

// Rota com um parâmetro na consulta
app.get('/users', (req, res) => {
  res.send(`Procurando o usuário de nome: ${req.query.nome}`);
});

// Rota para listar turmas (com filtro opcional por sigla)
app.get("/api/turmas", (req, res) => {
  const sigla = req.query.sigla ? `%${req.query.sigla}%` : "%";
  let sql = `
    SELECT * FROM Turma WHERE sigla LIKE '${sigla}';
  ` ;
  db.all(
    sql,
    (err, rows) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: "Erro ao consultar turmas" });
      }
      res.json(rows);
    }
  );
});

// TURMAS
// Rota para cadastrar turma
app.post("/api/turma", (req, res) => {
  const { sigla, curso, serie } = req.body;
  if (!sigla || !curso || !serie) {
    return res.status(400).json({ error: "Sigla, curso e série são obrigatórios" });
  }

  const stmt = db.prepare("INSERT INTO Turma (sigla, curso, serie) VALUES (?,?,?)");
  stmt.run(sigla, curso, serie, function (err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: "Erro ao inserir turma" });
    }
    res.json({ id: this.lastID, sigla, curso, serie});
  });
  stmt.finalize();
});

app.delete("/api/turmas/:id", (req, res) => {
    const { id } = req.params;
    db.run("DELETE FROM Turma WHERE id_turma = ?", [id], function (err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: "Erro ao deletar turma" });
    }
    res.json({ deleted: this.changes > 0 });
    });
});

app.put("/api/turmas/:id", (req, res) => {
    const { id } = req.params;
    const {sigla, curso, serie} = req.body;
    db.run("UPDATE Turma SET sigla = ?, curso = ?, serie = ? WHERE id_Turma = ?", [sigla, curso, serie, id], function (err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: "Erro ao atualizar turma" });
    }
    res.json({ updated: this.changes > 0 });
    });
});

// PROFESSORES
app.get("/api/professores", (req, res) => {
  const nome = req.query.nome ? `%${req.query.nome}%` : "%";
  let sql = `
    SELECT * FROM Professor WHERE nome LIKE '${nome}';
  ` ;
  db.all(
    sql,
    (err, rows) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: "Erro ao consultar professores" });
      }
      res.json(rows);
    }
  );
});

app.post("/api/professores", (req, res) => {
  const { nome, disciplina, matricula } = req.body;
  if (!nome || !disciplina || !matricula) {
    return res.status(400).json({ error: "Nome, disciplina e matrícula são obrigatórios" });
  }

  const stmt = db.prepare("INSERT INTO Professor (nome, disciplina, matricula) VALUES (?,?,?)");
  stmt.run(nome, disciplina, matricula, function (err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: "Erro ao inserir professor" });
    }
    res.json({ id: this.lastID, nome, disciplina, matricula});
  });
  stmt.finalize();
});

app.delete("/api/professores/:id", (req, res) => {
    const { id } = req.params;
    db.run("DELETE FROM Professor WHERE id_professor = ?", [id], function (err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: "Erro ao deletar professor" });
    }
    res.json({ deleted: this.changes > 0 });
    });
})

app.put("/api/professores/:id", (req, res) => {
  const { id } = req.params;
  const {nome, matricula, disciplina} = req.body;
  db.run("UPDATE Professor SET nome = ?, disciplina = ?, matricula = ? WHERE id_professor = ?", [nome, disciplina, matricula, id], function (err) {
  if (err) {
    console.log(err);
    return res.status(500).json({ error: "Erro ao atualizar professor" });
  }
  res.json({ updated: this.changes > 0 });
  });
});

app.listen(port, () => {
  console.log(`App de exemplo escutando em http://localhost:${port}`);
});

/* 
Exemplo de SQL INJECTION: 
X' UNION SELECT id_aluno, nome as sigla, matricula as curso, cpf as serie FROM Aluno;
*/
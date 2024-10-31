const scriptCriarTabelas = [
  '''
  CREATE TABLE IF NOT EXISTS funcionario (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(150),
      formacao VARCHAR(150),
      especialidade VARCHAR(200)
  );
  ''',
  '''
  CREATE TABLE IF NOT EXISTS procedimento (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(150),
      tipo VARCHAR(100),
      descricao VARCHAR(200),
      objetivo VARCHAR(100),
      tempoDuracao VARCHAR(10),
      valor DOUBLE,
      estado BOOLEAN,
      fk_funcionario INTEGER,
      FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id)
  );
  '''
];
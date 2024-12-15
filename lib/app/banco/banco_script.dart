const scriptCriarTabelas = [
  '''
  CREATE TABLE IF NOT EXISTS funcionario (
      id INTEGER PRIMARY KEY,
      nome VARCHAR(150),
      formacao VARCHAR(150),
      especialidade VARCHAR(200)
  );
  ''',
  '''
  CREATE TABLE IF NOT EXISTS cliente (
      id INTEGER PRIMARY KEY,
      nome VARCHAR(150),
      cidade VARCHAR(150),
      telefone VARCHAR(15)
  );
  ''',
  '''
  CREATE TABLE IF NOT EXISTS procedimento (
      id INTEGER PRIMARY KEY,
      nome VARCHAR(150),
      tipo VARCHAR(100),
      descricao VARCHAR(200),
      objetivo VARCHAR(100),
      tempoDuracao VARCHAR(10),
      valor DOUBLE,
      estado BOOLEAN,
      fk_funcionario INTEGER NOT NULL,
      FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id)
  );
  ''',
  '''
  CREATE TABLE IF NOT EXISTS agendamento (
      id INTEGER PRIMARY KEY,
      data VARCHAR(150),
      hora VARCHAR(100),
      fk_funcionario INTEGER NOT NULL,
      fk_procedimento INTEGER NOT NULL,
      fk_cliente INTEGER NOT NULL,
      FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id),
      FOREIGN KEY (fk_procedimento) REFERENCES procedimento(id),
      FOREIGN KEY (fk_cliente) REFERENCES cliente(id)
  );
  '''
];

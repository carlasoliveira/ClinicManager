const scriptCriarTabelas = [
  'CREATE TABLE IF NOT EXISTS procedimento ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'nome VARCHAR(150),'
      'tipo VARCHAR(100),'
      'descricao VARCHAR(200),'
      'objetivo VARCHAR(100),'
      'tempoDuracao VARCHAR(10),'
      'valor DOUBLE,'
      'estado BOOLEAN'
      ')'
];
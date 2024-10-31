import '../dto/dto_funcionario.dart';
import '../interface/i_dao_funcionario.dart';
import 'package:sqflite/sqflite.dart';
import '../../banco/sqlite/conexao.dart';

class DAOFuncionarioImpl implements IDAOFuncionario {
  late Database _db;

  final String inserirSQL = '''
    INSERT INTO funcionario (nome, formacao, especialidade) VALUES (?, ?, ?)
  ''';

  final String alterarSQL = '''
    UPDATE funcionario SET nome = ?, formacao = ?, especialidade = ?
  ''';

  final String excluirSQL = '''
    DELETE FROM funcionario WHERE id = ?
  ''';

  final String buscarSQL = '''
    SELECT * FROM funcionario
  ''';

  final String buscarPorIdSQL = '''
    SELECT * FROM funcionario WHERE id = ?
  ''';

  @override
  Future<DTOFuncionario> salvar(DTOFuncionario dtoFuncionario) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(inserirSQL, [
      dtoFuncionario.nome,
      dtoFuncionario.formacao,
      dtoFuncionario.especialidade,
    ]);
    dtoFuncionario.id = id;
    return dtoFuncionario;
  }

  @override
  Future<DTOFuncionario> alterar(DTOFuncionario dtoFuncionario) async {
    final db = await Conexao.abrir();
    print('Alterar funcionario ${dtoFuncionario.id}');
    int controle = await db.rawUpdate(alterarSQL, [
      dtoFuncionario.nome,
      dtoFuncionario.formacao,
      dtoFuncionario.especialidade,
      dtoFuncionario.id
    ]);

    if (controle == 0) {
      throw Exception('Erro ao alterar funcionario');
    }

    print('Funcionario ${dtoFuncionario.id} alterado com sucesso');
    return dtoFuncionario;
  }

  @override
  void excluir(dynamic id) async {
    _db = await Conexao.abrir();
    _db.rawDelete(excluirSQL, [id]);
  }

  @override
  Future<List<DTOFuncionario>> buscar() async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarSQL).then((value) {
      return value.map((e) => DTOFuncionario(
        id: e['id'],
        nome: e['nome'] as String, 
        formacao: e['formacao'] as String, 
        especialidade: e['especialidade'] as String)).toList();
    });
  }

  @override
  Future<DTOFuncionario> buscarPorId(int idFuncionario) async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarPorIdSQL, [idFuncionario]).then((value) {
      return DTOFuncionario(
        id: ['id'],
        nome: ['nome'] as String, 
        formacao: ["formacao"] as String, 
        especialidade: ['especialidade'] as String);
    });
  }
}

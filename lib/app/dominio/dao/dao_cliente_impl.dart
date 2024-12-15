import '../dto/dto_cliente.dart';
import '../interface/i_dao_cliente.dart';
import 'package:sqflite/sqflite.dart';
import '../../banco/sqlite/conexao.dart';

class DAOClienteImpl implements IDAOCliente {
  late Database _db;

  final String inserirSQL = '''
    INSERT INTO cliente (nome, cidade, telefone) VALUES (?, ?, ?)
  ''';

  final String alterarSQL = '''
    UPDATE cliente SET nome = ?, cidade = ?, telefone = ?
  ''';

  final String excluirSQL = '''
    DELETE FROM cliente WHERE id = ?
  ''';

  final String buscarSQL = '''
    SELECT * FROM cliente
  ''';

  final String buscarPorIdSQL = '''
    SELECT * FROM cliente WHERE id = ?
  ''';

  @override
  Future<DTOCliente> salvar(DTOCliente dtoCliente) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(inserirSQL, [
      dtoCliente.nome,
      dtoCliente.cidade,
      dtoCliente.telefone,
    ]);
    dtoCliente.id = id;
    return dtoCliente;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dtoCliente) async {
    final db = await Conexao.abrir();
    print('Alterar Cliente ${dtoCliente.id}');
    int controle = await db.rawUpdate(alterarSQL, [
      dtoCliente.nome,
      dtoCliente.cidade,
      dtoCliente.telefone,
      dtoCliente.id
    ]);

    if (controle == 0) {
      throw Exception('Erro ao alterar funcionario');
    }

    print('Cliente ${dtoCliente.id} alterado com sucesso');
    return dtoCliente;
  }

  @override
  void excluir(dynamic id) async {
    _db = await Conexao.abrir();
    _db.rawDelete(excluirSQL, [id]);
  }

  @override
  Future<List<DTOCliente>> buscar() async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarSQL).then((value) {
      return value.map((e) => DTOCliente(
        id: e['id'],
        nome: e['nome'] as String, 
        cidade: e['cidade'] as String, 
        telefone: e['telefone'] as String)).toList();
    });
  }

  @override
  Future<DTOCliente> buscarPorId(int idCliente) async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarPorIdSQL, [idCliente]).then((value) {
      return DTOCliente(
        id: ['id'],
        nome: ['nome'] as String, 
        cidade: ['cidade'] as String, 
        telefone: ['telefone'] as String);
    });
  }
}

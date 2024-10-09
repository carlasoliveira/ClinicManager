import '../dto/dto_procedimento.dart';
import '../interface/i_dao_procedimento.dart';
import 'package:sqflite/sqflite.dart';
import '../../banco/sqlite/conexao.dart';

class DAOProcedimentoImpl implements IDAOProcedimento {
  late Database _db;

  final String inserirSQL = '''
    INSERT INTO procedimento (nome, tipo, descricao, objetivo, tempoDuracao, valor, estado) VALUES (?, ?, ?, ?, ?, ?, ?)
  ''';

  final String alterarSQL = '''
    UPDATE procedimento SET nome = ?, tipo = ?, descricao = ?, objetivo = ?, tempoDuracao = ?, valor = ?, estado = ? WHERE id = ?
  ''';

  final String excluirSQL = '''
    DELETE FROM procedimento WHERE id = ?
  ''';

  final String buscarSQL = '''
    SELECT * FROM procedimento
  ''';

  final String buscarPorIdSQL = '''
    SELECT * FROM procedimento WHERE id = ?
  ''';

  @override
  Future<DTOProcedimento> salvar(DTOProcedimento dtoProcedimento) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(inserirSQL, [
      dtoProcedimento.nome,
      dtoProcedimento.tipo,
      dtoProcedimento.descricao,
      dtoProcedimento.objetivo,
      dtoProcedimento.tempoDuracao,
      dtoProcedimento.valor,
      dtoProcedimento.estado
    ]);
    dtoProcedimento.id = id;
    return dtoProcedimento;
  }

  @override
  Future<DTOProcedimento> alterar(DTOProcedimento dtoProcedimento) async {
    final db = await Conexao.abrir();
    print('Alterar procedimento ${dtoProcedimento.id}');
    int controle = await db.rawUpdate(alterarSQL, [
      dtoProcedimento.nome,
      dtoProcedimento.tipo,
      dtoProcedimento.descricao,
      dtoProcedimento.objetivo,
      dtoProcedimento.tempoDuracao,
      dtoProcedimento.valor,
      dtoProcedimento.estado,
      dtoProcedimento.id
    ]);

    if (controle == 0) {
      throw Exception('Erro ao alterar procedimento');
    }

    print('Procedimento ${dtoProcedimento.id} alterado com sucesso');
    return dtoProcedimento;
  }

  @override
  void excluir(dynamic id) async {
    _db = await Conexao.abrir();
    _db.rawDelete(excluirSQL, [id]);
  }

  @override
  Future<List<DTOProcedimento>> buscar() async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarSQL).then((value) {
      return value.map((e) => DTOProcedimento(
        id: e['id'],
        nome: e['nome'] as String, 
        tipo: e['tipo'] as String, 
        descricao: e['descricao'] as String, 
        objetivo: e['objetivo'] as String, 
        tempoDuracao: e['tempoDuracao'] as String, 
        valor:  e['valor'] as double, 
        estado: e['estado'] as int)).toList();
    });
  }

  @override
  Future<List<DTOProcedimento>> buscarPorId(int idProcedimento) async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarPorIdSQL, [idProcedimento]).then((value) {
      return value.map((e) => DTOProcedimento(
        id: e['id'],
        nome: e['nome'] as String, 
        tipo: e['tipo'] as String, 
        descricao: e['descricao'] as String, 
        objetivo: e['objetivo'] as String, 
        tempoDuracao: e['tempoDuracao'] as String, 
        valor:  e['valor'] as double, 
        estado: e['estado'] as int)).toList();
    });
  }
}

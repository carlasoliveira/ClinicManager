import 'package:projeto_flutter/app/dominio/dto/dto_agendamento.dart';

import '../dto/dto_agendamento.dart';
import '../interface/i_dao_agendamento.dart';
import 'package:sqflite/sqflite.dart';
import '../../banco/sqlite/conexao.dart';

class DAOAgendamentoImpl implements IDAOAgendamento {
  late Database _db;

  final String inserirSQL = '''
    INSERT INTO agendamento (data, hora, fk_funcionario, fk_procedimento, fk_cliente) VALUES (?, ?, ?, ?, ?)
  ''';

  final String alterarSQL = '''
    UPDATE agendamento SET data = ?, hora = ?, fk_funcionario = ?, fk_procedimento = ?, fk_cliente = ? WHERE id = ?
  ''';

  final String excluirSQL = '''
    DELETE FROM agendamento WHERE id = ?
  ''';

  final String buscarSQL = '''
    SELECT * FROM agendamento
  ''';

  final String buscarPorIdSQL = '''
    SELECT * FROM agendamento WHERE id = ?
  ''';

  @override
  Future<DTOAgendamento> salvar(DTOAgendamento dtoAgendamento) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(inserirSQL, [
      dtoAgendamento.data,
      dtoAgendamento.hora,
      dtoAgendamento.idFuncionario,
      dtoAgendamento.idProcedimento,
      dtoAgendamento.idCliente

    ]);
    dtoAgendamento.id = id;
    print("CHEGOU AQUIIIIIIII --------------------> ${dtoAgendamento.id}");
    return dtoAgendamento;
  }

  @override
  Future<DTOAgendamento> alterar(DTOAgendamento dtoAgendamento) async {
    final db = await Conexao.abrir();
    print('Alterar agendamento ${dtoAgendamento.id}');
    int controle = await db.rawUpdate(alterarSQL, [
      dtoAgendamento.data,
      dtoAgendamento.hora,
      dtoAgendamento.idFuncionario,
      dtoAgendamento.idProcedimento,
      dtoAgendamento.idCliente
    ]);

    if (controle == 0) {
      throw Exception('Erro ao alterar agendamento');
    }

    print('Agendamento ${dtoAgendamento.id} alterado com sucesso');
    return dtoAgendamento;
  }

  @override
  void excluir(dynamic id) async {
    _db = await Conexao.abrir();
    _db.rawDelete(excluirSQL, [id]);
  }

  @override
  Future<List<DTOAgendamento>> buscar() async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarSQL).then((value) {
      return value.map((e) => DTOAgendamento(
        id: e['id'],
        data: e['nome'] as String, 
        hora: e['tipo'] as String, 
        idFuncionario: e['fk_funcionario'] as dynamic,
        idProcedimento: e['fk_procedimento'] as dynamic,
        idCliente: e['fk_cliente'] as dynamic)).toList();
    });
  }

  @override
  Future<List<DTOAgendamento>> buscarPorId(int idAgendamento) async {
    _db = await Conexao.abrir();
    return _db.rawQuery(buscarPorIdSQL, [idAgendamento]).then((value) {
      return value.map((e) => DTOAgendamento(
        id: e['id'],
        data: e['nome'] as String, 
        hora: e['tipo'] as String, 
        idFuncionario: e['fk_funcionario'] as dynamic,
        idProcedimento: e['fk_procedimento'] as dynamic,
        idCliente: e['fk_cliente'] as dynamic)).toList();
    });
  }
}

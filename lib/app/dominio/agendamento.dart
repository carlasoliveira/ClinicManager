import 'package:projeto_flutter/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_flutter/app/dominio/interface/i_dao_agendamento.dart';

class Agendamento {
  late dynamic id;
  late String data;
  late String hora;
  late dynamic idFuncionario;
  late dynamic idProcedimento;
  late dynamic idCliente;

  late DTOAgendamento dto;
  late IDAOAgendamento dao;

  Agendamento({required this.dao});

  validacao({required DTOAgendamento dtoAgendamento}) {
    data = dtoAgendamento.data;
    hora = dtoAgendamento.hora;
    idFuncionario = dtoAgendamento.idFuncionario;
    idProcedimento = dtoAgendamento.idProcedimento;
    idCliente = dtoAgendamento.idCliente;
  }

  Future<DTOAgendamento> salvar(DTOAgendamento dto) async {
    validacao(dtoAgendamento: dto);
    return await dao.salvar(dto);
  }

  Future<DTOAgendamento> alterar(DTOAgendamento dto) async {
    return dao.alterar(dto);
  }

  void excluir(dynamic id) async {
    dao.excluir(id);
  }

  Future<List<DTOAgendamento>> buscar() async {
    return dao.buscar();
  }

  Future<List<DTOAgendamento>> buscarPorId(int idAgendamento) async {
    return dao.buscarPorId(idAgendamento);
  }
}

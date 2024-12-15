import 'package:projeto_flutter/app/dominio/dao/dao_agendamento_impl.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_flutter/app/dominio/agendamento.dart';

class APAgendamento {
  late DAOAgendamentoImpl dao;
  late Agendamento agendamento;

  APAgendamento(){
    dao = DAOAgendamentoImpl();
    agendamento = Agendamento(dao: dao);
  }

    Future<DTOAgendamento> salvar(DTOAgendamento dtoAgendamento) async {
      return await agendamento.salvar(dtoAgendamento);
    }

    Future<DTOAgendamento> alterar(DTOAgendamento dtoAgendamento) async {
      return await agendamento.alterar(dtoAgendamento);
    }

    void excluir(int id) {
      agendamento.excluir(id);
    }

    Future<List<DTOAgendamento>> buscar() async {
      return await agendamento.buscar();
    }

    Future<List<DTOAgendamento>> buscarPorId(int idAgendamento) async {
      return await agendamento.buscarPorId(idAgendamento);
    }
  }
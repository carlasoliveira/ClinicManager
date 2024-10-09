import 'package:projeto_flutter/app/dominio/dao/dao_procedimento_impl.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';
import 'package:projeto_flutter/app/dominio/procedimento.dart';

class APProcedimento {
  late DAOProcedimentoImpl dao;
  late Procedimento procedimento;

  APProcedimento(){
    dao = DAOProcedimentoImpl();
    procedimento = Procedimento(dao: dao);
  }

    Future<DTOProcedimento> salvar(DTOProcedimento dtoProcedimento) async {
      return await procedimento.salvar(dtoProcedimento);
    }

    Future<DTOProcedimento> alterar(DTOProcedimento dtoProcedimento) async {
      return await procedimento.alterar(dtoProcedimento);
    }

    void excluir(int id) {
      procedimento.excluir(id);
    }

    Future<List<DTOProcedimento>> buscar() async {
      return await procedimento.buscar();
    }

    Future<List<DTOProcedimento>> buscarPorId(int idProcedimento) async {
      return await procedimento.buscarPorId(idProcedimento);
    }
  }
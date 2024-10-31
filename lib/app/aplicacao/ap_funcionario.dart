import 'package:projeto_flutter/app/dominio/dao/dao_funcionario_impl.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/funcionario.dart';

class APFuncionario {
  late DAOFuncionarioImpl dao;
  late Funcionario funcionario;

  APFuncionario(){
    dao = DAOFuncionarioImpl();
    funcionario = Funcionario(dao: dao);
  }

    Future<DTOFuncionario> salvar(DTOFuncionario dtoFuncionario) async {
      return await funcionario.salvar(dtoFuncionario);
    }

    Future<DTOFuncionario> alterar(DTOFuncionario dtoFuncionario) async {
      return await funcionario.alterar(dtoFuncionario);
    }

    void excluir(int id) {
      funcionario.excluir(id);
    }

    Future<List<DTOFuncionario>> buscar() async {
      return await funcionario.buscar();
    }

    Future<DTOFuncionario> buscarPorId(int idFuncionario) async {
      return await funcionario.buscarPorId(idFuncionario);
    }
  }
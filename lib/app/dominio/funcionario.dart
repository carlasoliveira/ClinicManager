import 'package:flutter/foundation.dart';

import 'dto/dto_funcionario.dart';
import 'interface/i_dao_funcionario.dart';

class Funcionario{
  late dynamic id;
  late String nome;
  late String formacao;
  late String especialidade;

  late DTOFuncionario dto;
  late IDAOFuncionario dao;

  Funcionario({required this.dao});

    validacao({required DTOFuncionario dtoFuncionario}){
    nome = dtoFuncionario.nome;
    formacao = dtoFuncionario.formacao;
    especialidade = dtoFuncionario.especialidade;
  }

  Future<DTOFuncionario> salvar(DTOFuncionario dto) async{
    validacao(dtoFuncionario: dto);
    return await dao.salvar(dto);
  }

  Future<DTOFuncionario> alterar(DTOFuncionario dto) async{
    return dao.alterar(dto);
  }

  void excluir(dynamic id) async{
    dao.excluir(id);
  }

  Future<List<DTOFuncionario>> buscar() async{
    return dao.buscar();
  }

  Future<DTOFuncionario> buscarPorId(int idFuncionario) async{
    return dao.buscarPorId(idFuncionario);
  }
}
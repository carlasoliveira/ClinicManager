import 'package:flutter/foundation.dart';
import 'dto/dto_procedimento.dart';
import 'interface/i_dao_procedimento.dart';

class Procedimento {
  late dynamic id;
  late String nome;
  late String tipo;
  late String descricao;
  late String objetivo;
  late String tempoDuracao;
  late double valor;
  late int estado;
  late dynamic idFuncionario;

  late DTOProcedimento dto;
  late IDAOProcedimento dao;

  Procedimento({required this.dao});

    validacao({required DTOProcedimento dtoProcedimento}){
    nome = dtoProcedimento.nome;
    tipo = dtoProcedimento.tipo;
    descricao = dtoProcedimento.descricao;
    objetivo = dtoProcedimento.objetivo;
    tempoDuracao = dtoProcedimento.tempoDuracao;
    valor = dtoProcedimento.valor;
    estado = dtoProcedimento.estado;
    idFuncionario = dtoProcedimento.idFuncionario;
  }

  Future<DTOProcedimento> salvar(DTOProcedimento dto) async{
    validacao(dtoProcedimento: dto);
    return await dao.salvar(dto);
  }

  Future<DTOProcedimento> alterar(DTOProcedimento dto) async{
    return dao.alterar(dto);
  }

  void excluir(dynamic id) async{
    dao.excluir(id);
  }

  Future<List<DTOProcedimento>> buscar() async{
    return dao.buscar();
  }

  Future<List<DTOProcedimento>> buscarPorId(int idProcedimento) async{
    return dao.buscarPorId(idProcedimento);
  }
}
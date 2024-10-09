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

  late DTOProcedimento dto;
  late IDAOProcedimento dao;

  Procedimento({required this.dao}){
    id = dto.id;
    nome = dto.nome;
    tipo = dto.tipo;
    descricao = dto.descricao;
    objetivo = dto.objetivo;
    tempoDuracao = dto.tempoDuracao;
    valor = dto.valor;
    estado = dto.estado;
  }

  Future<DTOProcedimento> salvar(DTOProcedimento dto) async{
    return dao.salvar(dto);
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


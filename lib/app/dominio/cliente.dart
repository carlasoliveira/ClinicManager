import 'package:flutter/foundation.dart';
import 'dto/dto_cliente.dart';
import 'interface/i_dao_cliente.dart';

class Cliente {
  late dynamic id;
  late String nome;
  late String cidade;
  late String telefone;

  late DTOCliente dto;
  late IDAOCliente dao;

  Cliente({required this.dao});

    validacao({required DTOCliente dtoCliente}){
    nome = dtoCliente.nome;
    cidade = dtoCliente.cidade;
    telefone = dtoCliente.telefone;
  }

  Future<DTOCliente> salvar(DTOCliente dto) async{
    validacao(dtoCliente: dto);
    return await dao.salvar(dto);
  }

  Future<DTOCliente> alterar(DTOCliente dto) async{
    return dao.alterar(dto);
  }

  void excluir(dynamic id) async{
    dao.excluir(id);
  }

  Future<List<DTOCliente>> buscar() async{
    return dao.buscar();
  }

  Future<DTOCliente> buscarPorId(int idCliente) async{
    return dao.buscarPorId(idCliente);
  }
}
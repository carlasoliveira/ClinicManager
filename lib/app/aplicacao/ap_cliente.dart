import 'package:projeto_flutter/app/dominio/dao/dao_cliente_impl.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';
import 'package:projeto_flutter/app/dominio/cliente.dart';

class APCliente {
  late DAOClienteImpl dao;
  late Cliente cliente;

  APCliente(){
    dao = DAOClienteImpl();
    cliente = Cliente(dao: dao);
  }

    Future<DTOCliente> salvar(DTOCliente dtoCliente) async {
      return await cliente.salvar(dtoCliente);
    }

    Future<DTOCliente> alterar(DTOCliente dtoCliente) async {
      return await cliente.alterar(dtoCliente);
    }

    void excluir(int id) {
      cliente.excluir(id);
    }

    Future<List<DTOCliente>> buscar() async {
      return await cliente.buscar();
    }

    Future<DTOCliente> buscarPorId(int idCliente) async {
      return await cliente.buscarPorId(idCliente);
    }
  }
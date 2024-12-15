import '../dto/dto_cliente.dart';

abstract class IDAOCliente {
  Future<DTOCliente> salvar(DTOCliente dtoCliente);
  Future<DTOCliente> alterar(DTOCliente dtoCliente);
  void excluir(dynamic id);
  Future<List<DTOCliente>> buscar();
  Future<DTOCliente> buscarPorId(int idCliente);
}
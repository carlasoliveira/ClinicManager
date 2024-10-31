import '../dto/dto_funcionario.dart';

abstract class IDAOFuncionario {
  Future<DTOFuncionario> salvar(DTOFuncionario dtoFuncionario);
  Future<DTOFuncionario> alterar(DTOFuncionario dtoFuncionario);
  void excluir(dynamic id);
  Future<List<DTOFuncionario>> buscar();
  Future<DTOFuncionario> buscarPorId(int idFuncionario);
}
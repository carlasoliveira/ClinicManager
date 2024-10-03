import '../dto/dto_procedimento.dart';

abstract class IDAOProcedimento {
  Future<DTOProcedimento> salvar(DTOProcedimento dtoProcedimento);
  Future<DTOProcedimento> alterar(DTOProcedimento dtoProcedimento);
  Future<bool> excluir(int id);
  Future<List<DTOProcedimento>> buscar();
  Future<List<DTOProcedimento>> buscarPorId(int idProcedimento);
}
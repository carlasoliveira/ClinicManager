import '../dto/dto_agendamento.dart';

abstract class IDAOAgendamento {
  Future<DTOAgendamento> salvar(DTOAgendamento dtoAgendamento);
  Future<DTOAgendamento> alterar(DTOAgendamento dtoAgendamento);
  void excluir(dynamic id);
  Future<List<DTOAgendamento>> buscar();
  Future<List<DTOAgendamento>> buscarPorId(int idAgendamento);
}
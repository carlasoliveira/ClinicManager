class DTOAgendamento {
  late dynamic id;
  late String data;
  late String hora;
  late dynamic idFuncionario;
  late dynamic idProcedimento;
  late dynamic idCliente;

  late DTOAgendamento dto;

  DTOAgendamento(
      {this.id,
      required this.data,
      required this.hora,
      required this.idFuncionario,
      required this.idProcedimento,
      required this.idCliente});
}

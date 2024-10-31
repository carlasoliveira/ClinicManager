class DTOProcedimento {
  late dynamic id;
  late String nome;
  late String tipo;
  late String descricao;
  late String objetivo;
  late String tempoDuracao;
  late double valor;
  late int estado;
  late dynamic idFuncionario;

  DTOProcedimento(
      {this.id,
      required this.nome,
      required this.tipo,
      required this.descricao,
      required this.objetivo,
      required this.tempoDuracao,
      required this.valor,
      required this.estado,
      required this.idFuncionario});

}
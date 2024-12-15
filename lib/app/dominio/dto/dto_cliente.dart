class DTOCliente {
  late dynamic id;
  late String nome;
  late String cidade;
  late String telefone;

  DTOCliente(
      {this.id,
      required this.nome,
      required this.cidade,
      required this.telefone});
}
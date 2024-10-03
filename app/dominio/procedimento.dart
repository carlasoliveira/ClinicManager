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
  late bool estado;

  late DTOProcedimento dto;
  late IDAOProcedimento dao;

  Procedimento({required this.dto, required this.dao}){
    id = dto.id;
    nome = dto.nome;
    tipo = dto.tipo;
    descricao = dto.descricao;
    objetivo = dto.objetivo;
    tempoDuracao = dto.tempoDuracao;
    valor = dto.valor;
    estado = dto.estado;
  }

  void salvar(){
    dao.salvar(dto);
  }

  void alterar(DTOProcedimento dto){
    dao.alterar(dto);
  }

  void excluir(){
    dao.excluir(id);
  }
}


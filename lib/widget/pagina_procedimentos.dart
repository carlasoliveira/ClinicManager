import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';
import 'package:projeto_flutter/app/dominio/funcionario.dart';

@override
class ProcedimentoForm extends StatelessWidget {
  const ProcedimentoForm({Key? key}) : super(key: key);
  
  Future<List<DTOProcedimento>> buscar() async {
    APProcedimento apProcedimento = APProcedimento();

    //print(dtoTest.nome);

    return await apProcedimento.buscar();
  }

  Future<String> buscarFuncionario(int id) async {
    APFuncionario apFuncionario = APFuncionario();

    DTOFuncionario funcionario = await apFuncionario.buscarPorId(id);

    return funcionario.nome;
  }

  Widget build(BuildContext context) {
    
    void _excluirProcedimento(int id) async {

      APProcedimento apProcedimento = APProcedimento();

      return apProcedimento.excluir(id);
    }
 
    return Scaffold(
      appBar: AppBar(title: Text('Procedimentos')),
      body: FutureBuilder<List<DTOProcedimento>>(
          future: buscar(),
          builder: (context, consulta) {
            var dados = consulta.data;
            if (dados == null) {
              return Text('Dados não encontrados.');
            } else {
              final lista = consulta.data!;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var procedimento = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(procedimento.nome),
                    subtitle: Text(procedimento.descricao),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Procedimento'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${procedimento.nome}'),
                            Text('Tipo: ${procedimento.tipo}'),
                            Text('Descrição: ${procedimento.descricao}'),
                            Text('Objetivo: ${procedimento.objetivo}'),
                            Text('Tempo de Duração: ${procedimento.tempoDuracao}'),
                            Text('Valor: ${procedimento.valor}'),
                            Text('Funcionario: ${buscarFuncionario(procedimento.idFuncionario)}'),
                          ], 
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _excluirProcedimento(procedimento.id);
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
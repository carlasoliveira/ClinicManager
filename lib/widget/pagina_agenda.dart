import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_agendamento.dart';
import 'package:projeto_flutter/app/aplicacao/ap_cliente.dart';

import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';
import 'package:projeto_flutter/widget/form_agendamento.dart';
import 'package:projeto_flutter/widget/form_procedimento.dart';
import 'package:projeto_flutter/widget/pagina_procedimentos.dart';

@override
class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

late Future<List<DTOProcedimento>> _procedimentosFuture;
late Future<List<DTOFuncionario>> _funcionariosFuture;
late Future<List<DTOCliente>> _clientesFuture;

class _AgendaState extends State<Agenda> {
  Future<List<DTOAgendamento>> buscar() async {
    APAgendamento apAgendamento = APAgendamento();
    //print(dtoTest.nome);

    return await apAgendamento.buscar();
  }

  Future<String> buscarFuncionario(dynamic id) async {
    var nomeFunc = "";
    APFuncionario apFuncionario = APFuncionario();
    print("CHEGOU AQUI FUNÇÃO BUSCAR");
    DTOFuncionario funcionario = await apFuncionario.buscarPorId(id);
    print("nome do func ${funcionario.nome}");

    return funcionario.nome;
  }

  Future<String> buscarProcedimento(dynamic id) async {
    var nomeProc = "";
    APProcedimento apProcedimento = APProcedimento();
    print("CHEGOU AQUI FUNÇÃO BUSCAR");
    DTOProcedimento procedimento = (await apProcedimento.buscarPorId(id)) as DTOProcedimento;
    print("nome do func ${procedimento.nome}");

    return procedimento.nome;
  }

    Future<String> buscarCliente(dynamic id) async {
    var nomeCl = "";
    APCliente apCliente = APCliente();
    print("CHEGOU AQUI FUNÇÃO BUSCAR");
    DTOCliente cliente = await apCliente.buscarPorId(id);
    print("nome do func ${cliente.nome}");

    return cliente.nome;
  }

  Widget build(BuildContext context) {

    void _excluirProcedimento(int id) async {
      APProcedimento apProcedimento = APProcedimento();
      return apProcedimento.excluir(id);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamentos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormAgendamento()),
              ).then((value) => setState(() {
                    buscar();
                  }));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<DTOAgendamento>>(
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
                  var agendamento = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(agendamento.idCliente),
                    subtitle: Text(agendamento.data),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Agendamento'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Data: ${agendamento.data}'),
                            Text('Hora: ${agendamento.hora}'),
                            Text(
                                'Funcionario: ${buscarFuncionario(agendamento.idFuncionario)}'),
                            Text(
                                'Procedimento: ${buscarFuncionario(agendamento.idFuncionario)}'),
                            Text(
                                'Cliente: ${buscarFuncionario(agendamento.idFuncionario)}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              buscar();
                            });
                            _excluirProcedimento(agendamento.id);
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

import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_agendamento.dart';
import 'package:projeto_flutter/app/aplicacao/ap_cliente.dart';
import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_agendamento.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';

class FormAgendamento extends StatefulWidget {
  const FormAgendamento({Key? key}) : super(key: key);

  @override
  _FormAgendamentoState createState() => _FormAgendamentoState();
}

class _FormAgendamentoState extends State<FormAgendamento> {
  final _dataController = TextEditingController();
  final _horaController = TextEditingController();
  int? _funcionarioSelecionadoId;
  late Future<List<DTOFuncionario>> _funcionariosFuture;
  int? _procedimentoSelecionadoId;
  late Future<List<DTOProcedimento>> _procedimentosFuture;
  int? _clienteSelecionadoId;
  late Future<List<DTOCliente>> _clientesFuture;


 Future<List<DTOFuncionario>> listarFuncionarios() async {
    APFuncionario apFuncionario = APFuncionario();
    return await apFuncionario.buscar();
  }

  Future<List<DTOCliente>> listarClientes() async {
    APCliente apCliente = APCliente();
    return await apCliente.buscar();
  }

  Future<List<DTOProcedimento>> listarProcedimentos() async {
    APProcedimento apProcedimento = APProcedimento();
    return await apProcedimento.buscar();
  }

  @override
  void initState() {
    super.initState();
    _funcionariosFuture = listarFuncionarios();
    _clientesFuture = listarClientes();
    _procedimentosFuture = listarProcedimentos();
  }

  void _criarAgendamento() async {
    final data = _dataController.text;
    final hora = _horaController.text;
    final idFuncionario = _funcionarioSelecionadoId;
    final idProcedimento = _procedimentoSelecionadoId;
    final idCliente = _clienteSelecionadoId;

    if (idFuncionario == null) {
      // Exibir uma mensagem de erro se nenhum funcionário for selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione um funcionário')),
      );
      return;
    }

    if (idProcedimento == null) {
      // Exibir uma mensagem de erro se nenhum funcionário for selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione um procedimento')),
      );
      return;
    }

    if (idCliente == null) {
      // Exibir uma mensagem de erro se nenhum funcionário for selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione um cliente')),
      );
      return;
    }

    if (data.isEmpty || hora.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    DTOAgendamento dto = DTOAgendamento(
      data: data,
      hora: hora,
      idFuncionario: idFuncionario,
      idProcedimento: idProcedimento,
      idCliente: idCliente
    );

    APAgendamento apAgendamento = APAgendamento();
    await apAgendamento.salvar(dto);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Procedimento cadastrado com sucesso')),
    );

    _dataController.clear();
    _horaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Procedimentos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _dataController,
              key: Key('data'),
              decoration: InputDecoration(labelText: 'Data do agendamento'),
            ),
            TextFormField(
              controller: _horaController,
              key: Key('tipo'),
              decoration: InputDecoration(labelText: 'Hora do procedimento'),
            ),
            FutureBuilder<List<DTOFuncionario>>(
              future: _funcionariosFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  final funcionarios = snapshot.data!;
                  return DropdownButton<int>(
                    hint: Text('Selecione um funcionário'),
                    value: _funcionarioSelecionadoId,
                    onChanged: (int? newValue) {
                      setState(() {
                        _funcionarioSelecionadoId = newValue;
                      });
                    },
                    items: funcionarios.map((DTOFuncionario funcionario) {
                      return DropdownMenuItem<int>(
                        value: funcionario.id,
                        child: Text(funcionario.nome),
                      );
                    }).toList(),
                  );
                }
              },
            ),
            FutureBuilder<List<DTOProcedimento>>(
              future: _procedimentosFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  final procedimentos = snapshot.data!;
                  return DropdownButton<int>(
                    hint: Text('Selecione um procedimento'),
                    value: _procedimentoSelecionadoId,
                    onChanged: (int? newValue) {
                      setState(() {
                        _procedimentoSelecionadoId = newValue;
                      });
                    },
                    items: procedimentos.map((DTOProcedimento procedimento) {
                      return DropdownMenuItem<int>(
                        value: procedimento.id,
                        child: Text(procedimento.nome),
                      );
                    }).toList(),
                  );
                }
              },
            ),
            FutureBuilder<List<DTOCliente>>(
              future: _clientesFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  final clientes = snapshot.data!;
                  return DropdownButton<int>(
                    hint: Text('Selecione um cliente'),
                    value: _clienteSelecionadoId,
                    onChanged: (int? newValue) {
                      setState(() {
                        _clienteSelecionadoId = newValue;
                      });
                    },
                    items: clientes.map((DTOCliente cliente) {
                      return DropdownMenuItem<int>(
                        value: cliente.id,
                        child: Text(cliente.nome),
                      );
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarAgendamento,
              child: Text('Agendar'),
            ),
          ],
        ),
      ),
    );
  }
}

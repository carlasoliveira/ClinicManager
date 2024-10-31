import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';

class FormFuncionario extends StatefulWidget {
  const FormFuncionario({Key? key}) : super(key: key);

  @override
  _FormFuncionarioState createState() => _FormFuncionarioState();
}

class _FormFuncionarioState extends State<FormFuncionario> {
  final _nomeController = TextEditingController();
  final _formacaoController = TextEditingController();
  final _especialidadeController = TextEditingController();
  DTOProcedimento? _selectedProcedimento;
  late Future<List<DTOProcedimento>> _procedimentosFuture;

  @override
  void initState() {
    super.initState();
    _procedimentosFuture = buscarProcedimentos();
  }

  Future<List<DTOProcedimento>> buscarProcedimentos() async {
    APProcedimento apProcedimento = APProcedimento();
    return await apProcedimento.buscar();
  }

  void _criarFuncionario() async {
    final nome = _nomeController.text;
    final formacao = _formacaoController.text;
    final especialidade = _especialidadeController.text;
    

    DTOFuncionario dto = DTOFuncionario(
      nome: nome,
      formacao: formacao,
      especialidade: especialidade,
    );

    APFuncionario apFuncionario = APFuncionario();

    await apFuncionario.salvar(dto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Funcionários'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              key: Key('nome'),
              decoration: InputDecoration(labelText: 'Nome do funcionário'),
            ),
            TextFormField(
              controller: _formacaoController,
              key: Key('formacao'),
              decoration: InputDecoration(labelText: 'Formação do funcionário'),
            ),
            TextFormField(
              controller: _especialidadeController,
              key: Key('especialidade'),
              decoration: InputDecoration(labelText: 'Especialidade do funcionário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarFuncionario,
              child: Text('Criar Funcionário'),
            ),
          ],
        ),
      ),
    );
  }
}
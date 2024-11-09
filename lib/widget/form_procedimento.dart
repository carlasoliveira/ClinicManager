import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';

class FormProcedimento extends StatefulWidget {
  const FormProcedimento({Key? key}) : super(key: key);

  @override
  _FormProcedimentoState createState() => _FormProcedimentoState();
}

class _FormProcedimentoState extends State<FormProcedimento> {
  final _nomeController = TextEditingController();
  final _tipoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _objetivoController = TextEditingController();
  final _tempoDuracaoController = TextEditingController();
  final _valorController = TextEditingController();
  int? _funcionarioSelecionadoId;
  late Future<List<DTOFuncionario>> _funcionariosFuture;

  @override
  void initState() {
    super.initState();
    _funcionariosFuture = listarFuncionarios();
  }

  Future<List<DTOFuncionario>> listarFuncionarios() async {
    APFuncionario apFuncionario = APFuncionario();
    return await apFuncionario.buscar();
  }

  void _criarProcedimento() async {
    final nome = _nomeController.text;
    final tipo = _tipoController.text;
    final descricao = _descricaoController.text;
    final objetivo = _objetivoController.text;
    final tempoDuracao = _tempoDuracaoController.text;
    final valor = _valorController.text;
    final idFuncionario = _funcionarioSelecionadoId;

    if (idFuncionario == null) {
      // Exibir uma mensagem de erro se nenhum funcionário for selecionado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione um funcionário')),
      );
      return;
    }

    if (nome.isEmpty || tipo.isEmpty || descricao.isEmpty || objetivo.isEmpty || tempoDuracao.isEmpty || valor.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    DTOProcedimento dto = DTOProcedimento(
      nome: nome,
      tipo: tipo,
      descricao: descricao,
      objetivo: objetivo,
      tempoDuracao: tempoDuracao,
      valor: double.parse(valor),
      estado: 1,
      idFuncionario: idFuncionario,
    );

    APProcedimento apProcedimento = APProcedimento();
    await apProcedimento.salvar(dto);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Procedimento cadastrado com sucesso')),
    );

    _nomeController.clear();
    _tipoController.clear();
    _descricaoController.clear();
    _objetivoController.clear();
    _tempoDuracaoController.clear();
    _valorController.clear();
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
              controller: _nomeController,
              key: Key('nome'),
              decoration: InputDecoration(labelText: 'Nome do procedimento'),
            ),
            TextFormField(
              controller: _tipoController,
              key: Key('tipo'),
              decoration: InputDecoration(labelText: 'Tipo do procedimento'),
            ),
            TextFormField(
              controller: _descricaoController,
              key: Key('descricao'),
              decoration: InputDecoration(labelText: 'Descrição do procedimento'),
            ),
            TextFormField(
              controller: _objetivoController,
              key: Key('objetivo'),
              decoration: InputDecoration(labelText: 'Objetivo do procedimento'),
            ),
            TextFormField(
              controller: _tempoDuracaoController,
              key: Key('tempoDuracao'),
              decoration: InputDecoration(labelText: 'Tempo de duração do procedimento'),
            ),
            TextFormField(
              controller: _valorController,
              key: Key('valor'),
              decoration: InputDecoration(labelText: 'Valor do procedimento'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarProcedimento,
              child: Text('Criar Procedimento'),
            ),
          ],
        ),
      ),
    );
  }
}
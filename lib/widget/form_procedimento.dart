import 'package:flutter/material.dart';

class FormProcedimento extends StatelessWidget {
  const FormProcedimento({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _nomeController = TextEditingController();
    final _tipoController = TextEditingController();
    final _descricaoController = TextEditingController();
    final _objetivoController = TextEditingController();
    final _tempoDuracaoController = TextEditingController();
    final _valorController = TextEditingController();

    void _criarProcedimento() {
      final nome = _nomeController.text;
      final tipo = _tipoController.text;
      final descricao = _descricaoController.text;
      final objetivo = _objetivoController.text;
      final tempoDuracao = _tempoDuracaoController.text;
      final valor = _valorController.text;

      void criar(String nome, String tipo, String descricao, String objetivo,
          String tempoDuracao, String valor) {
        // Implementação da função criar
        print('Nome: $nome');
        print('Tipo: $tipo');
        print('Descrição: $descricao');
        print('Objetivo: $objetivo');
        print('Tempo de Duração: $tempoDuracao');
        print('Valor: $valor');
      }

      // Chame a função criar com os dados coletados
      criar(nome, tipo, descricao, objetivo, tempoDuracao, valor);
    }

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
                decoration:
                    InputDecoration(labelText: 'Descrição do procedimento'),
              ),
              TextFormField(
                controller: _objetivoController,
                key: Key('objetivo'),
                decoration:
                    InputDecoration(labelText: 'Objetivo do procedimento'),
              ),
              TextFormField(
                controller: _tempoDuracaoController,
                key: Key('tempoDuracao'),
                decoration: InputDecoration(
                    labelText: 'Tempo de duração de procedimento'),
              ),
              TextFormField(
                controller: _valorController,
                key: Key('valor'),
                decoration: InputDecoration(labelText: 'Valor do procedimento'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarProcedimento,
                child: Text('Criar Procedimento'),
              ),
            ],
          ),
        ));
  }
}

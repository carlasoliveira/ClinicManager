import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_cliente.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';

class FormCliente extends StatefulWidget {
  const FormCliente({Key? key}) : super(key: key);

  @override
  _FormClienteState createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  final _nomeController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _telefoneController = TextEditingController();
  DTOCliente? _selectedCliente;
  late Future<List<DTOCliente>> _clientesFuture;

  @override
  void initState() {
    super.initState();
    _clientesFuture = buscarProcedimentos();
  }

  Future<List<DTOCliente>> buscarProcedimentos() async {
    APCliente apCliente = APCliente();
    return await apCliente.buscar();
  }

  void _criarFuncionario() async {
    final nome = _nomeController.text;
    final cidade = _cidadeController.text;
    final telefone = _telefoneController.text;

    DTOCliente dto = DTOCliente(
      nome: nome,
      cidade: cidade,
      telefone: telefone,
    );

    APCliente apCliente = APCliente();

    await apCliente.salvar(dto);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cliente cadastrado com sucesso')),
    );

    _nomeController.clear();
    _cidadeController.clear();
    _telefoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Clientes'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              key: Key('nome'),
              decoration: InputDecoration(labelText: 'Nome do cliente'),
            ),
            TextFormField(
              controller: _cidadeController,
              key: Key('cidade'),
              decoration: InputDecoration(labelText: 'Cidade do cliente'),
            ),
            TextFormField(
              controller: _telefoneController,
              key: Key('telefone'),
              decoration:
                  InputDecoration(labelText: 'Telefone do cliente'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _criarFuncionario,
              child: Text('Cadastrar cliente'),
            ),
          ],
        ),
      ),
    );
  }
}

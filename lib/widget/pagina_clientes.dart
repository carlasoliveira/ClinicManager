import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_cliente.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_cliente.dart';
import 'package:projeto_flutter/widget/form_cliente.dart';

@override
class Cliente extends StatefulWidget{
  const Cliente({Key? key}):super(key: key);

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  Future<List<DTOCliente>> buscar() async {
    APCliente apCliente = APCliente();

    //print(dtoTest.nome);

    return await apCliente.buscar();
  }

  Widget build(BuildContext context) {
    void _excluirCliente(int id) async {

      APCliente apCliente = APCliente();

      return apCliente.excluir(id);
    }
  
  void _selecionarCliente(BuildContext context) async {
    final clientes = await buscar();
    DTOCliente? selectedCliente;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione um Cliente'),
          content: DropdownButton<DTOCliente>(
            hint: Text('Selecione um Cliente'),
            value: selectedCliente,
            onChanged: (DTOCliente? newValue) {
              selectedCliente = newValue;
            },
            items: clientes.map((DTOCliente cliente) {
              return DropdownMenuItem<DTOCliente>(
                value: cliente,
                child: Text(cliente.nome),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                // Salvar o cliente selecionado
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    return Scaffold(
      appBar: AppBar(title: Text('Clientes'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
             Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormCliente()),
                  ).then((value) => setState(() {
                    buscar();
                  }));
          },
        ),
      ],
      ),
      body: FutureBuilder<List<DTOCliente>>(
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
                  var cliente = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(cliente.nome),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Cliente'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${cliente.nome}'),
                            Text('Cidade: ${cliente.cidade}'),
                            Text('Telefone: ${cliente.telefone}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState((){
                              buscar();
                            });
                            _excluirCliente(cliente.id);
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


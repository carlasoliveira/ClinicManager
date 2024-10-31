import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/aplicacao/ap_funcionario.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_funcionario.dart';

@override
class Funcionario extends StatelessWidget{
  const Funcionario({Key? key}):super(key: key);

  Future<List<DTOFuncionario>> buscar() async {
    APFuncionario apFuncionario = APFuncionario();

    //print(dtoTest.nome);

    return await apFuncionario.buscar();
  }

  Widget build(BuildContext context) {
    void _excluirFuncionario(int id) async {

      APFuncionario apFuncionario = APFuncionario();

      return apFuncionario.excluir(id);
    }
  
  void _selecionarFuncionario(BuildContext context) async {
    final funcionarios = await buscar();
    DTOFuncionario? selectedFuncionario;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione um Funcionário'),
          content: DropdownButton<DTOFuncionario>(
            hint: Text('Selecione um Funcionário'),
            value: selectedFuncionario,
            onChanged: (DTOFuncionario? newValue) {
              selectedFuncionario = newValue;
            },
            items: funcionarios.map((DTOFuncionario funcionario) {
              return DropdownMenuItem<DTOFuncionario>(
                value: funcionario,
                child: Text(funcionario.nome),
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
                // Salvar o funcionário selecionado
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    return Scaffold(
      appBar: AppBar(title: Text('Funcionarios')),
      body: FutureBuilder<List<DTOFuncionario>>(
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
                  var funcionario = lista[index];
                  return ExpansionTile(
                    leading: Icon(Icons.person),
                    title: Text(funcionario.nome),
                    subtitle: Text(funcionario.formacao),
                    children: <Widget>[
                      ListTile(
                        title: Text('Detalhes do Funcionario'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome: ${funcionario.nome}'),
                            Text('Tipo: ${funcionario.formacao}'),
                            Text('Descrição: ${funcionario.especialidade}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _excluirFuncionario(funcionario.id);
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


import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/dominio/dto/dto_procedimento.dart';
import 'package:projeto_flutter/app/aplicacao/ap_procedimento.dart';

@override
class ProcedimentoForm extends StatelessWidget {
  const ProcedimentoForm({Key? key}) : super(key: key);

  Future<List<DTOProcedimento>> buscar() async {
    DTOProcedimento dto = DTOProcedimento(
        nome: "nome",
        tipo: "tipo",
        descricao: "descricao",
        objetivo: "objetivo",
        tempoDuracao: "5 ",
        valor: 100,
        estado: 1);
    APProcedimento apProcedimento = APProcedimento();
    DTOProcedimento dtoTest = await apProcedimento.salvar(dto);

    print(dtoTest.nome);

    return await apProcedimento.buscar();
  }

  Widget build(BuildContext context) {
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
                  return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(procedimento.nome),
                      subtitle: Text(procedimento.descricao));
                },
              );
            }
          }),
    );
  }
}

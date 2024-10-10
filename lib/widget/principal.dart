import 'package:flutter/material.dart';
import 'package:projeto_flutter/route.dart';
import 'package:projeto_flutter/tools.dart';
import 'package:projeto_flutter/widget/form_procedimento.dart';
import 'package:projeto_flutter/widget/menu_lateral.dart';
import 'package:projeto_flutter/widget/pagina_clientes.dart';
import 'package:projeto_flutter/widget/pagina_procedimentos.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
          title: Text('Clínica de Estética'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormProcedimento()),
                  );
                },
                child: Text('Ir para Formulário de Procedimento'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProcedimentoForm()),
                  );
                },
                child: Text('Ir para Lista de Procedimento'),
              ),
            ],
          ),
        ));
  }
}

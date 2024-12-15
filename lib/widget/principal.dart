import 'package:flutter/material.dart';
import 'package:projeto_flutter/route.dart';
import 'package:projeto_flutter/tools.dart';
import 'package:projeto_flutter/widget/form_procedimento.dart';
import 'package:projeto_flutter/widget/form_funcionario.dart';
import 'package:projeto_flutter/widget/menu_lateral.dart';
import 'package:projeto_flutter/widget/pagina_clientes.dart';
import 'package:projeto_flutter/widget/pagina_funcionarios.dart';
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
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Clientes'),
                subtitle: Text('Acesse a lista de clientes e realize novos cadastros'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Acessar clientes'),
                    onPressed: () {Navigator.pushNamed(context, '/clientes');},
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.people),
                title: Text('Funcionários'),
                subtitle: Text('Acesse a lista de funcionários e realize novos cadastros'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Acessar funcionários'),
                    onPressed: () {Navigator.pushNamed(context, '/funcionarios');},
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Procedimentos'),
                subtitle: Text('Acesse a lista de procedimentos e realize novos cadastros'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Acessar procedimentos'),
                    onPressed: () {Navigator.pushNamed(context, '/procedimentos');},
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}

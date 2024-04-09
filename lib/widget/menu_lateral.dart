import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget> [
          DrawerHeader(
            child: Text('Clínica de Estética'),
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
            ),
          ),
          ListTile(
            title: Text('Agenda'),
            onTap: () {
              Navigator.pushNamed(context, '/agenda');
            },
          ),
          ListTile(
            title: Text('Clientes'),
            onTap: () {
              Navigator.pushNamed(context, '/clientes');
            },
          ),
          ListTile(
            title: Text('Funcionários'),
            onTap:() {
              Navigator.pushNamed(context, '/funcionarios');
            },
          ),
          ListTile(
            title: Text('Procedimentos'),
            onTap: () {
              Navigator.pushNamed(context, '/procedimentos');
            }
          )
        ],
      ),
    );
  }
}
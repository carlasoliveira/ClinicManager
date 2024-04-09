import 'package:flutter/material.dart';
import 'package:projeto_flutter/route.dart';
import 'package:projeto_flutter/tools.dart';
import 'package:projeto_flutter/widget/menu_lateral.dart';
import 'package:projeto_flutter/widget/pagina_clientes.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
        title: Text('Clínica de Estética'),
        ),
        body: Column(
          children: [
                                                                
          ],
        ));
  }
}

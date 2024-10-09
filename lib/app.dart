import 'package:flutter/material.dart';
import 'package:projeto_flutter/widget/pagina_agenda.dart';
import 'package:projeto_flutter/widget/pagina_clientes.dart';
import 'package:projeto_flutter/widget/pagina_funcionarios.dart';
import 'package:projeto_flutter/widget/pagina_procedimentos.dart';
import 'package:projeto_flutter/widget/principal.dart';

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Clínica de Estética',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade200),
        scaffoldBackgroundColor: Colors.pink.shade50,
        useMaterial3: false,
      ),
      routes: {
        '/': (context) => Principal(),
        '/procedimentos': (context) => ProcedimentoForm(),
        '/funcionarios' : (context) => Funcionario(),
        '/clientes': (context) => Cliente(),
        '/agenda': (context) => Agenda(),
      },
    );
  }
}
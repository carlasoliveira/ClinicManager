import 'package:flutter/material.dart';

@override
class Agenda extends StatelessWidget{
  const Agenda({Key? key}):super(key: key);
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda')),
        //body: const Text('Formulário de Alunos'),
      );
  }
}
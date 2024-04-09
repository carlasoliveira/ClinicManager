import 'package:flutter/material.dart';

@override
class Procedimento extends StatelessWidget{
  const Procedimento({Key? key}):super(key: key);
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Procedimentos')),
        //body: const Text('Formulário de Alunos'),
      );
  }
}
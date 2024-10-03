import 'package:flutter/material.dart';

@override
class Funcionario extends StatelessWidget{
  const Funcionario({Key? key}):super(key: key);
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Funcionários')),
      );
  }
}


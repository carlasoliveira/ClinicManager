import 'package:flutter/material.dart';

class Cliente extends StatelessWidget{
  const Cliente({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes')),
      );
  }
}


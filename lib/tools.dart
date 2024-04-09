import 'package:flutter/material.dart';

class Tools {
  
  static Widget createButton({required titulo, required rota, required context}){
    return ElevatedButton(
          child: Text (titulo),
          onPressed: (){
            Navigator.pushNamed(context, rota);
          },
        );
  }
}
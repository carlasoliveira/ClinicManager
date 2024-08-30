import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_flutter/dominio/tipoProcedimento.dart';

void main() {
  group('Tipo de procedimento preenchido não pode ser vazio', () { 
    test('Tipo de procedimento preenchido', () {
      expect(() => tipoProcedimento('Facial'), returnsNormally);
    });

    test('Tipo de procedimento vazio', () {
      expect(() => tipoProcedimento(''), throwsException);
    });
  });

  group('Tipo não pode ser repetido', () {
    test('Não há procedimento igual', (){
      var novoTipoProcedimento = temTipoRepetido();
      expect(novoTipoProcedimento, false);
    });

    test('Procedimento igual já cadastrado', (){
      var verificaTipoProcedimento = temTipoRepetido();
      expect(verificaTipoProcedimento, true);
    });
   });
}
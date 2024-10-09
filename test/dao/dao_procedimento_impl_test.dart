import 'package:flutter_test/flutter_test.dart';
import '../../lib/app/dominio/dao/dao_procedimento_impl.dart';
import '../../lib/app/dominio/dto/dto_procedimento.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../lib/app/banco/sqlite/conexao.dart';

void main() {
  group('Teste DAOProcedimentoImpl', () {
    late Database db;
    late DAOProcedimentoImpl dao;

    setUpAll(() async {
      databaseFactory = databaseFactoryFfi;
      sqfliteFfiInit();
      db = await Conexao.abrir();
      dao = DAOProcedimentoImpl();
    });

    group('Teste Scripts SQL', () {
      test('Insert', () async {
        int result = await db.rawInsert(dao.inserirSQL, [
          'Teste Nome',
          'Teste Tipo',
          'Teste Descricao',
          'Teste Objetivo',
          '30 min',
          100.0,
          1
        ]);

        expect(result, isPositive);
      });

    test('Update', () async {
        var result = await db.rawUpdate(dao.alterarSQL, [
          'Update Nome',
          'Update Tipo',
          'Update Description',
          'Update Objetivo',
          '45 min',
          150.0,
          1,
          1
        ]);

        expect(result, isPositive);
      });

      test('Delete Script', () async {
        var result = await db.rawDelete(dao.excluirSQL, [1]);

        expect(result, isPositive);
      });

      test('List', () async {
        var result = await db.rawQuery(dao.buscarSQL);

        expect(result, isEmpty);
      });
    });

    test('Create Procedimento', () async {
      var dtoProcedimento = DTOProcedimento(
        nome: 'Teste Nome',
        tipo: 'Teste Tipo',
        descricao: 'Teste Descricao',
        objetivo: 'Teste Objetivo',
        tempoDuracao: '30 min',
        valor: 100.0,
        estado: 1,
      );

      var dto = await dao.salvar(dtoProcedimento);

      print("Procedimento criado");

      print(
          'ID: ${dto.id}, Nome: ${dto.nome}, Tipo: ${dto.tipo}, Descricao: ${dto.descricao}, Objetivo: ${dto.objetivo}, TempoDuracao: ${dto.tempoDuracao}, Valor: ${dto.valor}, Estado: ${dto.estado}');
    });

    test('   Procedimento', () async {
      var dto = await dao.buscarPorId(1);

      print("Read Procedimento");

      dto.forEach((procedimento) {
        print(
            'ID: ${procedimento.id}, Nome: ${procedimento.nome}, Tipo: ${procedimento.tipo}, Descricao: ${procedimento.descricao}, Objetivo: ${procedimento.objetivo}, TempoDuracao: ${procedimento.tempoDuracao}, Valor: ${procedimento.valor}, Estado: ${procedimento.estado}');
      });
    });

    test('Atualizar Procedimento', () async {
      var dtoProcedimento = (await dao.buscarPorId(1)).first;

      dtoProcedimento.nome = 'Updated Nome';

      var dto = await dao.alterar(dtoProcedimento);

      print("Procedimento atualizado");

      print(
          'ID: ${dto.id}, Nome: ${dto.nome}, Tipo: ${dto.tipo}, Descricao: ${dto.descricao}, Objetivo: ${dto.objetivo}, TempoDuracao: ${dto.tempoDuracao}, Valor: ${dto.valor}, Estado: ${dto.estado}');
    });

    test('Apagar Procedimento', () async {
      var result = await dao.excluir(1);

      expect(result, isTrue);

      print("Procedimento apagado");
    });

    test('Listar todos Procedimentos', () async {
      var dtoList = await dao.buscar();

      print("Lista de todos Procedimentos");

      if (dtoList.isEmpty) {
        print('No procedimentos found');
      }

      dtoList.forEach((dto) {
        print(
            'ID: ${dto.id}, Nome: ${dto.nome}, Tipo: ${dto.tipo}, Descricao: ${dto.descricao}, Objetivo: ${dto.objetivo}, TempoDuracao: ${dto.tempoDuracao}, Valor: ${dto.valor}, Estado: ${dto.estado}');
      });
    });
  });
}

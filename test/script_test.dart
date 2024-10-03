//import 'package:sqflite_common/sqlite_api.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() {
  /*late Database db;
  setUpAll(()async  {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    db = await Conexao.abrir();
  });
  test('teste script create table', () async {
    var list = await db.rawQuery('SELECT * FROM tipo_procedimento');
    expect(list.length, 3);
  });
}


class DAOProfessor implements IDAOProfessor {
  late Database _db;
  @override
  Future<DTOProfessor> alterarStatus(DTOProfessor dto) {
    // TODO: implement alterarStatus
    throw UnimplementedError();
  }

  @override
  Future<DTOProfessor> salvar(DTOProfessor dto) async {
    _db = await Conexao.abrir();
    int id = await _db
        .rawInsert('''INSERT INTO tipo_procedimento (tipoProcedimento)
      VALUES (?,?,?,?)''', [dto.tipoDeProcedimento]);
    dto.id = id;
    return dto;
  }*/
}
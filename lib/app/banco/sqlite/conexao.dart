import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../banco_script.dart';

class Conexao {
  static late Database _db;
  static bool conexaoCriada = false;

  static Future<Database> abrir() async {
    if (!conexaoCriada) {
      var path = join(await getDatabasesPath(), 'banco.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          scriptCriarTabelas.forEach(db.execute);
        },
      );
      conexaoCriada = true;
    }
    return _db;
  }

  static Future<void> fechar() async {
    if (conexaoCriada) {
      await _db.close();
      conexaoCriada = false;
    }
  }
}

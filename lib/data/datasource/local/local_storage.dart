import 'package:sqflite/sqflite.dart';
import 'package:tu_cancha/domain/model/reservacion_model.dart';

import 'local.dart';

class SqliteLocal extends Local {
  final Database _db;
  SqliteLocal(this._db);

  @override
  Future<void> addReservation(Reservation reservation) async {
    await _db.insert("reserv", reservation.toJson());
  }

  @override
  Future<List<Reservation>> getReservations() async {
    final result = await _db.query("reserv", orderBy: "fecha");
    return result.map((e) => Reservation.fromMap(e)).toList();
  }

  @override
  Future<int> deleteReservation(int id) async {
    return await _db.delete("reserv", where: 'id = ?', whereArgs: [id]);
  }
}

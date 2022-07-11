import 'package:tu_cancha/domain/model/reservacion_model.dart';
import 'package:tu_cancha/domain/repository/reservation_repository.dart';

import '../datasource/local/local.dart';

class ReservationRepositoryImplement extends ReservationRepository {
  final Local _local;

  ReservationRepositoryImplement(this._local);

  @override
  Future<void> addResertacion(Reservation reservation) async {
    await _local.addReservation(reservation);
  }

  @override
  Future<List<Reservation>> getReservation() async {
    return _local.getReservations();
  }

  @override
  Future<int> deleteReservation(int id) async {
    return await _local.deleteReservation(id);
  }
}

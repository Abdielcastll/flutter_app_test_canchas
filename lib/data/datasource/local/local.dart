import 'package:tu_cancha/domain/model/reservacion_model.dart';

abstract class Local {
  Future<List<Reservation>> getReservations();
  Future<void> addReservation(Reservation reservation);
  Future<int> deleteReservation(int id);
}

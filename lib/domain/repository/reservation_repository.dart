import 'package:tu_cancha/domain/model/reservacion_model.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservation();
  Future<void> addResertacion(Reservation reservation);
  Future<int> deleteReservation(int id);
}

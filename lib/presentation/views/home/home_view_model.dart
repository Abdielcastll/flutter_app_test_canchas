import 'package:stacked/stacked.dart';
import 'package:tu_cancha/domain/model/reservacion_model.dart';
import 'package:tu_cancha/domain/repository/reservation_repository.dart';
import 'package:tu_cancha/presentation/views/reserve/reserve_view.dart';

import '../../routes/navigator.dart';

class HomeViewModel extends BaseViewModel {
  final NavigatorService _navigator;
  final ReservationRepository _repository;
  bool _loading = false;

  HomeViewModel(this._repository, this._navigator);
  List<Reservation> reservations = [];

  Future<void> onInit() async {
    await getReservations();
  }

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getReservations() async {
    loading = true;
    reservations = await _repository.getReservation();
    loading = false;
  }

  Future<void> deleteReservation(int id) async {
    loading = true;
    reservations.removeWhere((e) => e.id == id);
    await _repository.deleteReservation(id);
    loading = false;
  }

  Future<void> goToReserve() async {
    await _navigator
        .navigateToPage(ReserveView.routeName)
        .then((_) => getReservations());
  }
}

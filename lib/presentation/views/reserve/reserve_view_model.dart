import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tu_cancha/data/datasource/remote/http_response_model.dart';
import 'package:tu_cancha/data/utils/courts.dart';
import 'package:tu_cancha/domain/model/weather_model.dart';
import 'package:tu_cancha/domain/model/reservacion_model.dart';
import 'package:tu_cancha/domain/repository/reservation_repository.dart';
import 'package:tu_cancha/domain/repository/weather_repository.dart';
import 'package:tu_cancha/presentation/routes/navigator.dart';
import 'package:tu_cancha/presentation/widgets/dialogs.dart';

import '../../../domain/model/cancha_model.dart';

class ReserveViewModel extends BaseViewModel {
  ReserveViewModel(this._navigator, this._repository, this._weatherRepository);
  final WeatherRepository _weatherRepository;
  final ReservationRepository _repository;
  final NavigatorService _navigator;
  late Weather weather;
  bool _loading = false;
  List<Court> courts = [];
  String? selectedCourt;
  String? name;
  DateTime? selectedDate;
  Timeframe? timeframe;

  PageController pageController =
      PageController(viewportFraction: 0.8, initialPage: 1);

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> onInit(BuildContext context) async {
    await loadWheather(context);
    initCourts();
  }

  Future<void> loadWheather(BuildContext context) async {
    loading = true;
    var resp = await _weatherRepository.getWeather();
    if (resp is Success) {
      weather = resp.response;
      loading = false;
    } else if (resp is Failure) {
      goBack();
      Dialogs.alert(context, text: resp.message);
    }
  }

  void initCourts() {
    courts.addAll(courtsData);
    notifyListeners();
  }

  void selectCourt(String? value) {
    selectedCourt = value;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    var _day = weather.days.firstWhere(
      (e) => e.date == date,
      orElse: () => weather.days.last,
    );
    timeframe = _day.timeframes[0];
    notifyListeners();
  }

  void onChangedName(String value) {
    name = value;
    notifyListeners();
  }

  Future<bool> checkAvailability() async {
    final reservations = await _repository.getReservation();
    var resp = reservations.where((e) {
      return DateFormat.yMd().format(e.fecha) ==
              DateFormat.yMd().format(selectedDate!) &&
          e.nombreCancha == selectedCourt;
    });
    if (resp.length <= 2) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveReservation() async {
    loading = true;
    var resp = await checkAvailability();
    if (resp) {
      var canchaTemp = courts.firstWhere((e) => e.name == selectedCourt);
      await _repository.addResertacion(
        Reservation(
          fecha: selectedDate!,
          nombreUsuario: name!,
          climaIcon: timeframe!.wxIcon,
          climaPrecPorc: timeframe!.probPrecipPct,
          climaDesc: timeframe!.wxDesc,
          nombreCancha: selectedCourt!,
          ubicacionCancha: canchaTemp.address,
          imgCancha: canchaTemp.img,
        ),
      );
      goBack();
      loading = false;
      return true;
    } else {
      loading = false;
      return false;
    }
  }

  bool validateData() {
    return (selectedCourt != null && name != null && selectedDate != null);
  }

  void goBack() {
    _navigator.pop();
  }
}

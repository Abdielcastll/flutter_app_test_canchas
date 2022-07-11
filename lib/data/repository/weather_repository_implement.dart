import 'package:tu_cancha/domain/repository/weather_repository.dart';

import '../datasource/remote/remote.dart';

class WeatherRepositoryImplement extends WeatherRepository {
  final Remote _remote;
  WeatherRepositoryImplement(this._remote);

  @override
  Future<Object> getWeather() async {
    return await _remote.getWeather();
  }
}

import 'package:tu_cancha/data/datasource/remote/http.dart';
import 'package:tu_cancha/data/datasource/remote/remote.dart';
import 'package:tu_cancha/domain/model/weather_model.dart';

class HttpRemote extends Remote {
  final Http _http;
  HttpRemote(this._http);

  @override
  Future<Object> getWeather() async {
    return await _http.request(
      '/forecast/9.93,-63.16',
      queryParameters: {
        "app_id": "9ccd9833",
        "app_key": "16aa8e7f41814217a31ce03669d037d4",
        "lang": "es"
      },
      parser: (data) {
        return Weather.fromJson(data);
      },
    );
  }
}

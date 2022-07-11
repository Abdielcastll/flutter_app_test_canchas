import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tu_cancha/data/datasource/remote/http.dart';
import 'package:tu_cancha/data/repository/reservation_repository_implement.dart';
import 'package:tu_cancha/data/repository/weather_repository_implement.dart';
import 'package:tu_cancha/domain/repository/reservation_repository.dart';
import 'package:tu_cancha/domain/repository/weather_repository.dart';

import '../../data/datasource/local/local.dart';
import '../../data/datasource/local/local_storage.dart';
import '../../data/datasource/remote/http_remote.dart';
import '../../data/datasource/remote/remote.dart';
import '../routes/navigator.dart';

GetIt getIt = GetIt.I;

Future<void> initializeDI() async {
  await _data();
  _view();
}

Future<void> _data() async {
  Logger logger = Logger();
  final dio = Dio(BaseOptions(baseUrl: 'http://api.weatherunlocked.com/api'));
  final http = Http(dio: dio, logger: logger, logsEnabled: true);

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'reservation.db');
  logger.d(path);

  final db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE reserv (
      id INTEGER PRIMARY KEY,
      fecha TEXT,
      nombreUsuario TEXT,
      climaIcon TEXT,
      climaPrecPorc TEXT,
      climaDesc TEXT,
      nombreCancha TEXT,
      ubicacionCancha TEXT,
      imgCancha TEXT
    );''');
    },
  );

  //  DATA
  getIt.registerSingleton<Local>(SqliteLocal(db));
  getIt.registerSingleton<Remote>(HttpRemote(http));
  getIt.registerSingleton<ReservationRepository>(
      ReservationRepositoryImplement(getIt()));
  getIt.registerSingleton<WeatherRepository>(
      WeatherRepositoryImplement(getIt()));
}

void _view() {
  getIt.registerSingleton<NavigatorService>(NavigatorService(Logger()));
}

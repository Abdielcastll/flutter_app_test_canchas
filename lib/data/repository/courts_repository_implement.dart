import 'package:tu_cancha/data/utils/courts.dart';
import 'package:tu_cancha/domain/model/cancha_model.dart';
import 'package:tu_cancha/domain/repository/courts_repository.dart';

class CourtsRepositoryImplemet extends CourtsRepository {
  @override
  List<Court> getCourts() {
    return courtsData;
  }
}

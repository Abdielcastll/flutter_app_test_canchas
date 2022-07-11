import 'package:test/test.dart';
import 'package:tu_cancha/domain/repository/reservation_repository.dart';
import 'package:tu_cancha/presentation/routes/navigator.dart';
import 'package:mockito/mockito.dart';
import 'package:tu_cancha/presentation/views/home/home_view_model.dart';

class MockReservationRepository extends Mock implements ReservationRepository {}

class MockNavigatorServices extends Mock implements NavigatorService {}

void main() {
  group('InitHomeViewModel', () {
    var repository = MockReservationRepository();
    when(repository.getReservation()).thenAnswer((_) async => []);
    var model = HomeViewModel(
      repository,
      MockNavigatorServices(),
    );
    test('getReservations', () async {
      await model.getReservations();
      expect(model.reservations, isEmpty);
    });
  });
}

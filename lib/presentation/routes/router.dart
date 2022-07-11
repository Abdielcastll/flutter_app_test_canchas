import 'package:flutter/material.dart';
import 'package:tu_cancha/presentation/views/reserve/reserve_view.dart';

import '../views/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ReserveView.routeName:
      return MaterialPageRoute(builder: (context) => const ReserveView());
    default:
      return MaterialPageRoute(builder: (context) => const HomeView());
  }
}

import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class NavigatorService {
  final Logger _log;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorService(this._log);

  Future<dynamic> navigateToPage(String routeName, {dynamic arguments}) async {
    _log.i('navigateToPage: routeName: $routeName');
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToPageWithReplacement(String routeName) async {
    _log.i('navigateToPageWithReplacement: '
        'routeName: $routeName');
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  void pop<T>([T? result]) {
    _log.i('goBack:');
    navigatorKey.currentState?.pop(result);
  }
}

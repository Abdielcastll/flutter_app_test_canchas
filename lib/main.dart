import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/di/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/routes/navigator.dart';
import 'presentation/routes/router.dart';
import 'presentation/views/home/home_view.dart';
import 'presentation/views/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu cancha App',
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigatorService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeView.routeName,
      theme: theme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      locale: const Locale('es', 'ES'),
    );
  }
}

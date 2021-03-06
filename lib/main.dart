import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maaradh/Providers/CarsProvider.dart';
import 'package:maaradh/Providers/LocationProvider.dart';
import 'package:provider/provider.dart';

import '../Providers/LocationProvider.dart';
import 'Providers/DearlersProvider.dart';
import 'Screens/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarsProvider>(
          create: (_) => CarsProvider(),
        ),
        ChangeNotifierProvider<DealerProvider>(
          create: (_) => DealerProvider(),
        ),
        ChangeNotifierProvider<LocationProvider>(
          create: (_) => LocationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale(
            'ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent,
        ),
        home: MainScreen(),
      ),
    );
  }
}

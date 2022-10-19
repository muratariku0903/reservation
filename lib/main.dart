import 'package:flutter/material.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/reservation/reservation_page.dart';
import 'presentation/pages/signup/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reservation Sys',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        SfGlobalLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ja'), Locale('en')],
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/reservation': (context) => const ReservationPage(),
      },
    );
  }
}

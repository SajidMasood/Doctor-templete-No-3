import 'package:doctor_template_no_3/screens/top_services/top_services.dart';
import 'package:flutter/material.dart';

import 'screens/booking_screen/booking_screen.dart';
import 'screens/bottom_nav/bottom_nav.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/initial_screen/initial_screen.dart';
import 'screens/symptom_screen/symptom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'avenir',
        primarySwatch: Colors.blue,
      ),
      //home: const InitialScreen(),
      initialRoute: '/initial',
      routes: {
        '/initial': (context) => const InitialScreen(),
        '/bottom': (context) => const BottomNav(),
        '/home': (context) => const HomeScreen(),
        '/symptoms': (context) => const SymptomScreen(),
        '/top_services': (context) => TopServices(),
        '/bookingScreen': (context) => BookingScreen(),
      },
    );
  }
}

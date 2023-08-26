import 'package:flutter/material.dart';
import 'package:pill_pall/screens/base_screen.dart';
import 'package:pill_pall/screens/medicine_detail_screen.dart';

void main() {
  runApp(PillPall());
}

class PillPall extends StatelessWidget {
  const PillPall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pill Pall',
      theme: ThemeData(
          textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  fontFamily: 'Satisfy',
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500)),
          primaryTextTheme: const TextTheme(
              headlineMedium: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 149, 231, 154),
            foregroundColor: Colors.white,
          )),
      home: const BaseScreen(),
      routes: {
        MedicineDetailScreen.routeName: (ctx) => const MedicineDetailScreen()
      },
    );
  }
}

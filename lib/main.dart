import 'package:flutter/material.dart';
import 'package:pill_pall/screens/base_screen.dart';

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
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 149, 231, 154),
            foregroundColor: Colors.white,
          )),
      home: const BaseScreen(),
    );
  }
}

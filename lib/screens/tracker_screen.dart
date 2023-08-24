import 'package:flutter/material.dart';
import 'package:pill_pall/widgets/next_pill.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Next pill in",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            NextPill()
          ],
        ),
      ),
    );
  }
}

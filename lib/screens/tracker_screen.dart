import 'package:flutter/material.dart';
import 'package:pill_pall/util/constants.dart';
import 'package:pill_pall/widgets/medicine_item.dart';
import 'package:pill_pall/widgets/next_pill.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Next medicine in",
          //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          // ),
          // Padding(padding: EdgeInsets.only(top: 10)),
          NextPill(),
          SizedBox(
            height: 20,
          ),
          MedicineItem(medicine: dummyMedicine)
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_pall/models/medicine.dart';
import 'package:pill_pall/util/app_icons.dart';
import 'package:pill_pall/util/enums.dart';
import 'package:pill_pall/widgets/medicine_info.dart';
import 'package:pill_pall/widgets/tag.dart';

class NextPill extends StatefulWidget {
  const NextPill({super.key});

  @override
  State<NextPill> createState() => _NextPillState();
}

class _NextPillState extends State<NextPill> {
  static var countdownDuration = Duration(hours: 1, minutes: 30, seconds: 0);
  Duration duration = Duration();
  Timer? timer;
  bool countDown = true;
  Medicine medicine = Medicine(
      id: 1,
      name: "Paracetamol",
      consumptionStart: DateTime.now(),
      nextConsumtionTime: DateTime.now(),
      period: 3,
      unit: TimeUnit.day,
      quantity: 30,
      startingQuantity: 30,
      quantityUnit: QuantityUnit.piece);

  @override
  void initState() {
    countdownDuration = Duration(hours: 1, minutes: 30, seconds: 0);

    _startTimer();
    _reset();

    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final date = DateFormat("yMMMEd").format(DateTime.now());

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        height: mediaQuery.size.height * 0.275,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home_cover.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(mediaQuery.size.width * 0.1)),
            color: Colors.grey.shade200),
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: mediaQuery.viewPadding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.bell_slash,
                          color: Colors.black87.withOpacity(0.55),
                        ))
                  ],
                ),
                Expanded(child: SizedBox(height: 10)),
                Text(
                  "Next pill in:",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTime(),
                      IconButton(
                          onPressed: () =>
                              showMedicineInfo(context, medicine: medicine),
                          icon: Icon(
                            Icons.info_rounded,
                            size: 30,
                            color: Colors.black87.withOpacity(0.55),
                          ))
                    ]),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.medication_liquid_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      "Paracetamol",
                      color: Colors.white.withOpacity(0.55),
                      radius: 5,
                      stye: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
              ]),
        ),
      ),
    );
  }

  void showMedicineInfo(BuildContext ctx, {required Medicine medicine}) {
    showDialog(
        context: ctx,
        builder: (_) => Dialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: MedicineInfo(medicine: medicine),
            ));
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }

    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(minutes: 1), (_) => _substractTime());
  }

  void _substractTime() {
    const substractMinutes = 1;
    setState(() {
      final minutes = duration.inMinutes - substractMinutes;
      if (minutes < 0) {
        timer?.cancel();
      } else {
        duration = Duration(minutes: minutes);
      }
    });
  }

  void _reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  String computeTime() {
    final hours = duration.inHours.remainder(24) < 10
        ? "0${duration.inHours.remainder(24)}"
        : "${duration.inHours.remainder(24)}";

    final minutes = duration.inMinutes.remainder(60) < 10
        ? "0${duration.inMinutes.remainder(60)}"
        : "${duration.inMinutes.remainder(60)}";

    return "$hours h $minutes min";
  }

  Widget buildTime() {
    final time = computeTime();

    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withOpacity(0.55)),
      child: Text(
        time,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 25),
      ),
    );
  }
}

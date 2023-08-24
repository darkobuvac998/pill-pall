import 'dart:async';

import 'package:flutter/material.dart';
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

  final String imageUrl =
      "https://images.unsplash.com/photo-1676364423874-19c785db3e61?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjY4fHxtZWRpY2luZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60";

  @override
  void initState() {
    countdownDuration = Duration(hours: 1, minutes: 30, seconds: 0);

    _startTimer();
    _reset();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              buildTime(),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.medication_liquid_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Tag(
                      "Paracetamol",
                      color: Colors.white.withOpacity(0.55),
                      radius: 15,
                      stye: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ]),
      ),
    );
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
    timer = Timer.periodic(Duration(seconds: 1), (_) => _substractTime());
  }

  void _addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void _substractTime() {
    const substractSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - substractSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
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

    final seconds = duration.inSeconds.remainder(60) < 10
        ? "0${duration.inSeconds.remainder(60)}"
        : "${duration.inSeconds.remainder(60)}";

    return "$hours:$minutes:$seconds";
  }

  Widget buildTime() {
    final time = computeTime();

    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.55)),
      child: Text(
        time,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),
      ),
    );
  }
}

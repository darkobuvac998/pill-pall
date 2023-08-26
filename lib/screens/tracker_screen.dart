import 'package:flutter/material.dart';
import 'package:pill_pall/util/constants.dart';
import 'package:pill_pall/widgets/medicine_item.dart';
import 'package:pill_pall/widgets/next_pill.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NextPill(),
          Stack(
            children: [
              Container(
                height: mediaQuery.size.height * 0.05,
                color: Color.fromARGB(255, 255, 213, 83),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(mediaQuery.size.width * 0.1))),
                height: mediaQuery.size.height * 0.05,
              ),
              Positioned(
                  left: mediaQuery.size.width * 0.05,
                  bottom: mediaQuery.size.height * 0.01,
                  child: Text(
                    "Today",
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
              Positioned(
                  right: mediaQuery.size.width * 0.01,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (_, inedex) => MedicineItem(medicine: items[inedex]),
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}

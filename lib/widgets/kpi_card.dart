import 'package:flutter/material.dart';
import 'package:pill_pall/widgets/tag.dart';

class KpiCard extends StatelessWidget {
  final IconData? icon;
  final String kpiTitle;
  final String kpiValue;
  final double? aspectRatio;
  const KpiCard(
      {super.key,
      required this.kpiTitle,
      required this.kpiValue,
      this.icon,
      this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 1,
      child: Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade200, width: 2),
            boxShadow: [BoxShadow(offset: Offset(-1, 2), color: Colors.white)],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Tag(
                kpiTitle,
                stye: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Tag(
                kpiValue,
                stye: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

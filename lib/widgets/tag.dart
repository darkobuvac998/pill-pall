// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  late final TextStyle? stye;
  late final String text;
  late final Color? color;
  late final double? radius;
  late final IconData? icon;

  Tag(
    this.text, {
    Key? key,
    this.stye,
    this.color,
    this.radius,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0), color: color),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
            SizedBox(
              width: 5.0,
            ),
            FittedBox(
              child: Text(
                text,
                style: stye,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ] else ...[
            FittedBox(
              child: Text(
                text,
                style: stye,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

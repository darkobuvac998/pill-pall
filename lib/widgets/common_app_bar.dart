import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 3,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: IconButton(
            icon: Icon(Icons.notifications_none_sharp, color: Colors.black87),
            onPressed: () {},
          ),
        )
      ],
      title: Text(
        "Pill Pall",
        style: TextStyle(
            fontFamily: "Satisfy", fontSize: 24, color: Colors.black87),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

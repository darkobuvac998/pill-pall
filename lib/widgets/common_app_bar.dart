import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return PreferredSize(
      preferredSize: Size.fromHeight(mediaQuery.size.height * 0.5),
      child: AppBar(
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
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home_cover.png"),
                    fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

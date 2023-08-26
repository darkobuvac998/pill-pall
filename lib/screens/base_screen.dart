import 'package:flutter/material.dart';
import 'package:pill_pall/screens/not_implemented_screen.dart';
import 'package:pill_pall/screens/tracker_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  List<Widget> _screens = [];
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _screens = [
        TrackerScreen(),
        NotImplementedScreen(
          message: "Pharmacy screen is not implemented",
        ),
        NotImplementedScreen(
          message: "Add screeen is not implemented",
        ),
        NotImplementedScreen(
          message: "Search screeen is not implemented",
        ),
        NotImplementedScreen(
          message: "Profile screeen is not implemented",
        )
      ];
      _isInit = false;
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  void _onIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(),
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)]),
          child: BottomNavigationBar(
            selectedFontSize: 10,
            unselectedFontSize: 10,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedItemColor: Colors.black87,
            selectedItemColor: Colors.white,
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 255, 213, 83),
            items: const [
              BottomNavigationBarItem(label: 'Time', icon: Icon(Icons.alarm)),
              BottomNavigationBarItem(
                  label: 'Pharmacy', icon: Icon(Icons.monitor_heart_sharp)),
              BottomNavigationBarItem(
                  label: 'Add', icon: Icon(Icons.add_box_outlined)),
              BottomNavigationBarItem(
                  label: 'Search', icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.account_circle_outlined)),
            ],
            onTap: _onIconTap,
            currentIndex: _currentIndex,
          ),
        ),
      ),
    );
  }
}

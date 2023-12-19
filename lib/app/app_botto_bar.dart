import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/my_tasks_screen.dart';

class AppBottomBarPage extends StatefulWidget {
  static AppBottomBarPage builder(BuildContext context, GoRouterState state) =>
      const AppBottomBarPage();

  const AppBottomBarPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBottomBarPage> createState() => _AppBottomBarPageState();
}

class _AppBottomBarPageState extends State<AppBottomBarPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _listViewBody = [
    const HomeScreen(),
    const MyTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewBody[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.other_houses),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month_sharp),
            label: 'My Tasks',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[300],
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

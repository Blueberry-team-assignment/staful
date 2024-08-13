import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/screens/calendar_screen.dart';
import 'package:staful/screens/pay_screen.dart';
import 'package:staful/screens/setting_screen.dart';
import 'package:staful/screens/staff_screen.dart';

class BottomNavLayout extends StatefulWidget {
  const BottomNavLayout({super.key});

  @override
  State<BottomNavLayout> createState() => _BottomNavLayoutState();
}

class _BottomNavLayoutState extends State<BottomNavLayout> {
  int _currentIndex = 0;

  final List<Widget> childScreens = [
    const CalendarScreen(),
    const StaffScreen(),
    const PayScreen(),
    const SettingScreen()
  ];

  void handleOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleOnTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              label: "캘린더",
              icon: SvgPicture.asset('lib/assets/icons/icon_calendar.svg')),
          BottomNavigationBarItem(
              label: "직원",
              icon: SvgPicture.asset('lib/assets/icons/icon_users.svg')),
          BottomNavigationBarItem(
              label: "급여",
              icon: SvgPicture.asset('lib/assets/icons/icon_users.svg')),
          BottomNavigationBarItem(
              label: "설정",
              icon: SvgPicture.asset('lib/assets/icons/icon_settings.svg')),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: childScreens[_currentIndex],
    );
  }
}

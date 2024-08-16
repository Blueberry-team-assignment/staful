import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/screens/calendar/calendar_screen.dart';
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

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _screens = [
    const CalendarScreen(),
    const StaffScreen(),
    const PayScreen(),
    const SettingScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => _screens[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            label: "캘린더",
            icon: SvgPicture.asset('lib/assets/icons/icon_calendar.svg'),
          ),
          BottomNavigationBarItem(
            label: "직원",
            icon: SvgPicture.asset('lib/assets/icons/icon_users.svg'),
          ),
          BottomNavigationBarItem(
            label: "급여",
            icon: SvgPicture.asset('lib/assets/icons/icon_users.svg'),
          ),
          BottomNavigationBarItem(
            label: "설정",
            icon: SvgPicture.asset('lib/assets/icons/icon_settings.svg'),
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

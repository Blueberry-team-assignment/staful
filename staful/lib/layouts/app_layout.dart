import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/screens/calendar/monthly_calendar_screen.dart';
import 'package:staful/screens/pay_screen.dart';
import 'package:staful/screens/setting_screen.dart';
import 'package:staful/screens/staff/staff_screen.dart';

class AppLayout extends StatefulWidget {
  final Widget child;
  final String? appBarType;
  final bool showBottomNavigationBar;

  const AppLayout({
    super.key,
    required this.child,
    this.appBarType = "back",
    this.showBottomNavigationBar = false,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MonthlyCalendarScreen(),
    const StaffScreen(),
    const PayScreen(),
    const SettingScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: switch (_currentIndex) {
        0 => appBarWithLogo(context),
        // _ => navigateBackAppBar(context),
        _ => PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
                // color: Colors.red,
                )),
      },
      body: widget.showBottomNavigationBar
          ? _screens[_currentIndex] // 바텀내비게이션바가 보이는 화면에서는 터치시 화면이동.
          : widget.child,
      bottomNavigationBar:
          widget.showBottomNavigationBar ? buildBottomAppBar(context) : null,
    );
  }

  BottomNavigationBar buildBottomAppBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: _onTap,
      items: [
        buildBottomNavItems("캘린더", "icon_calendar.svg", 0),
        buildBottomNavItems("직원", "icon_users.svg", 1),
        buildBottomNavItems("급여", "icon_users.svg", 2),
        buildBottomNavItems("설정", "icon_settings.svg", 3),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
    );
  }

  BottomNavigationBarItem buildBottomNavItems(label, imgPath, index) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      label: label,
      icon: SvgPicture.asset(
        "lib/assets/icons/$imgPath",
        color: index == _currentIndex
            ? Theme.of(context).primaryColor
            : Colors.black,
      ),
    );
  }
}

AppBar? buildAppBar(String appBarType, BuildContext context) {
  switch (appBarType) {
    case "logo":
      return appBarWithLogo(context);
    case "back":
      return navigateBackAppBar(context);
    case "none":
      return AppBar(
        leading: const ColoredBox(
          color: Colors.red,
          child: SizedBox(
            height: 50,
          ),
        ),
      );
    default:
      return null; // 기본값을 설정
  }
}

AppBar appBarWithLogo(BuildContext context) {
  return AppBar(
    leadingWidth: 93 + 30,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        SvgPicture.asset(
          'lib/assets/icons/logo_STAFull.svg',
        ),
      ],
    ),
  );
}

AppBar navigateBackAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leadingWidth: 100,
    leading: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

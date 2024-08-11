import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ko', 'KR'),
      ],
      path: 'lib/assets/translations',
      child: const MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "MainFont",
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1e7e1c),
          primary: const Color(0xff1e7e1c),
          primaryContainer: const Color(0xff1e7e1c).withOpacity(0.1),
          onPrimaryContainer: const Color(0xff1e7e1c).withOpacity(0.3),
          secondary: const Color(0xffd1d1d1),
          surface: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

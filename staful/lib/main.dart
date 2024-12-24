import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/firebase_options.dart';
import 'package:staful/feature/auth/log_in/log_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await addDummyData(); // firestore에 더미데이터 넣기

  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ko', 'KR'),
        ],
        path: 'lib/assets/translations',
        child: const STAFFul(),
      ),
    ),
  );
}

class STAFFul extends StatefulWidget {
  const STAFFul({super.key});

  @override
  State<STAFFul> createState() => _STAFFulState();
}

class _STAFFulState extends State<STAFFul> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        // useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "MainFont",
          ),
        ),
        scaffoldBackgroundColor: const Color(0xffFAFAFA),
        primaryColor: const Color(0xff1e7e1c),
        primaryColorLight: const Color(0xffebffeb),
        primaryColorDark: const Color(0xff013d00),
        disabledColor: const Color(0xffd1d1d1),
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

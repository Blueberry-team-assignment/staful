import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/auth/presentation/ui/log_in_screen.dart';
import 'package:staful/feature/calendar/presentation/calendar_screen.dart';
import 'package:staful/ui/layouts/app_layout.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(logInProvider);
    final notifier = ref.watch(logInProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.checkUser();
    });

    if (loginState.isLoggedIn && loginState.authUser?.uid != null) {
      return const AppLayout(
        appBarType: "logo",
        showBottomNavigationBar: true,
        child: CalendarScreen(),
      );
    }

    return const LoginScreen();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/auth/presentation/ui/log_in_screen.dart';
import 'package:staful/feature/calendar/presentation/calendar_screen.dart';
import 'package:staful/feature/staff/presentation/provider/staff_provider.dart';
import 'package:staful/feature/template/presentation/provider/template_provider.dart';
import 'package:staful/provider/uid_provider.dart';
import 'package:staful/ui/layouts/app_layout.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffNotifier = ref.read(staffNotifierProvider.notifier);
    final templateNotifier = ref.read(templateNotifierProvider.notifier);
    final uid = ref.watch(uidProvider);
    final loginState = ref.watch(logInProvider);
    final loginNotifier = ref.read(logInProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!loginState.isLoggedIn && !loginState.isLoading) {
        await loginNotifier.checkUser();
      }
      if (uid != null && staffNotifier.mounted == true) {
        staffNotifier.fetchAllStaffs();
      }
      if (uid != null && templateNotifier.mounted == true) {
        templateNotifier.fetchAllTemplates();
      }
    });

    if (loginState.isLoggedIn && uid != null) {
      return const AppLayout(
        appBarType: "logo",
        showBottomNavigationBar: true,
        child: CalendarScreen(),
      );
    }

    return const LoginScreen();
  }
}

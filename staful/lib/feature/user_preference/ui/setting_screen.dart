import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/auth/presentation/ui/log_in_screen.dart';
import 'package:staful/feature/user_preference/ui/language_settings_screen.dart';
import 'package:staful/feature/user_preference/ui/store_detail_screen.dart';
import 'package:staful/ui/widgets/bottom_sheet_widget.dart';
import 'package:staful/ui/widgets/column_item_container.dart';
import 'package:staful/feature/staff_info/presentation/ui/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(logInProvider);
    final logInNotifier = ref.read(logInProvider.notifier);

    void onLogoutSuccess() async {
      try {
        await logInNotifier.logout();
        if (loginState.isLoggedIn == false) {
          Navigator.of(context).pop();
          openPage(context, const LoginScreen());
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "설정",
                      style: TextStyleConfig(size: 24).setTextStyle(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      // color: Colors.white,
                      child: const StaffProfileWidget(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ColumnItemContainer(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "매장 정보",
                        style: contentTextStyle,
                      ),
                      IconButton(
                        onPressed: () => openPage(
                          context,
                          const StoreDetailScreen(),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ColumnItemContainer(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "언어 설정",
                        style: contentTextStyle,
                      ),
                      IconButton(
                        onPressed: () => openPage(
                          context,
                          const LanguageSettingsScreen(),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showCustomBottomSheet(
                  context: context,
                  title: "로그아웃 하시겠습니까?",
                  subTitle: "",
                  successMessage: "확인",
                  onSuccess: onLogoutSuccess,
                );
              },
              child: const Center(
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:staful/screens/setting/language_settings_screen.dart';
import 'package:staful/screens/setting/store_detail_screen.dart';
import 'package:staful/screens/staff/staff_info_screen.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/utils/navigation_helpers.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/screens/staff/staff_info_screen.dart';
import 'package:staful/domain/utils/app_styles.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({
    super.key,
  });

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "언어 설정",
                  style: titleStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ColumnItemContainer(
              content: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "언어",
                        style: contentTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2024년 08월 01일",
                            style: contentTextStyle,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon:
                                const Icon(Icons.keyboard_arrow_right_outlined),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ColumnItemContainer(
              content: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "언어",
                        style: contentTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2024년 08월 01일",
                            style: contentTextStyle,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon:
                                const Icon(Icons.keyboard_arrow_right_outlined),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

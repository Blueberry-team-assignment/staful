import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/ui/screens/staff/staff_info_screen.dart';
import 'package:staful/domain/utils/app_styles.dart';
import 'package:staful/ui/widgets/simple_text_button_widget.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({
    super.key,
  });

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
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
                  "매장 정보 수정",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 30,
                  child: SimpleTextButtonWidget(
                    text: "수정",
                    onPressed: onPressed,
                  ),
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
                        "매장명",
                        style: contentTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "어쩌구저쩌구매장",
                        style: contentTextStyle,
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
                        "사장님 이름",
                        style: contentTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "김 선미",
                        style: contentTextStyle,
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
                        "개업일",
                        style: contentTitleStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "2024년 08월 01일",
                        style: contentTextStyle,
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

  void onPressed() {}
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/layouts/calendar_screen_layout.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class EditScheduleScreen extends StatefulWidget {
  const EditScheduleScreen({super.key});

  @override
  State<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  bool isOnEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: NavigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  "근무 시간",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 43,
                  height: 29,
                  child: TextButton(
                    onPressed: () => isOnEditMode = true,
                    style: ButtonStyle(
                      // alignment: Alignment.topCenter,s
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Theme.of(context).primaryColorLight,
                      ),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                      ),
                    ),
                    child: const Text(
                      "수정",
                      style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "근무자",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          StaffProfileWidget(imageName: "Ellipse 5.png"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "매니저",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "근무 날짜",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "08.01 목요일",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "근무 시간",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "10:00 - 20:00",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:staful/screens/calendar/edit_schedule_screen.dart';
import 'package:staful/screens/calendar/schedule_screen.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class DailyCalendarScreen extends StatelessWidget {
  const DailyCalendarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "오늘 근무자",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.05),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        // onTap: () => handleCurrentIndex(1),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScheduleScreen(
                              date: DateTime.now(),
                            ),
                          ),
                        ),
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform.translate(
                                    offset: const Offset(0, 2),
                                    child: Text(
                                      "목요일",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -2),
                                    child: Text(
                                      "08.01",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StaffProfileWidget(
                                  name: "매니저",
                                  imageName: "Ellipse 2.png",
                                ),
                                StaffProfileWidget(
                                  name: "이나라",
                                  imageName: "Ellipse 3.png",
                                ),
                                StaffProfileWidget(
                                  name: "김경민",
                                  imageName: "Ellipse 4.png",
                                ),
                                StaffProfileWidget(
                                  name: "김선미",
                                  imageName: "Ellipse 5.png",
                                ),
                                StaffProfileWidget(
                                  name: "신동찬",
                                  imageName: "Ellipse 2.png",
                                ),
                                StaffProfileWidget(
                                  name: "매니저",
                                  imageName: "Ellipse 3.png",
                                ),
                                StaffProfileWidget(
                                  name: "이나라",
                                  imageName: "Ellipse 4.png",
                                ),
                                StaffProfileWidget(
                                  name: "김경민",
                                  imageName: "Ellipse 5.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "다음 근무표",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 58,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "금",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "08.02",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StaffProfileWidget(
                            imageName: "Ellipse 2.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 3.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 4.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 5.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 2.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 3.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 4.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            ),
            child: Row(
              children: [
                Container(
                  // width: 58,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 58,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "토",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "08.03",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StaffProfileWidget(
                            imageName: "Ellipse 2.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 3.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 4.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 5.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 2.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 3.png",
                          ),
                          StaffProfileWidget(
                            imageName: "Ellipse 4.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:staful/widgets/staff_profile_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 70,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CalendarScreen(),
                        ),
                      )
                    },
                    icon: SvgPicture.asset(
                      'lib/assets/icons/logo_STAFull.svg',
                      // alignment: Alignment.centerLeft,
                      // width: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
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
                      // padding: const EdgeInsets.all(10),
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
                          Container(
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
                            child: SizedBox(
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "목요일",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(0, -4),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
              Column(
                children: [
                  Container(
                    // padding:
                    // const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    height: 82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      children: [
                        Container(
                          // width: 58,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          height: 58,
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("금"),
                              Text("08.02"),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Flexible(
                            child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: const Row(
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
                    color: Colors.red,
                    child: const Row(
                      children: [Text("hi")],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

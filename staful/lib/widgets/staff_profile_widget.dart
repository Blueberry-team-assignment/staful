import 'package:flutter/material.dart';

class StaffProfileWidget extends StatelessWidget {
  final String? name;
  final String imageName;

  const StaffProfileWidget({
    super.key,
    this.name,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 42,
      height: 66,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              "lib/assets/images/$imageName",
            ),
          ),
          // if (name != null)
          //   Text(
          //     name!,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // if (name == null) const Spacer()
        ],
      ),
    );
  }
}

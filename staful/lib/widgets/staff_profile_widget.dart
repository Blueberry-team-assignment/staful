import 'package:flutter/material.dart';

class StaffProfileWidget extends StatelessWidget {
  final String? name;
  final String imageName;
  final String? size;

  const StaffProfileWidget({
    super.key,
    this.name,
    required this.imageName,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == null ? 42 : 74,
      height: size == null ? 66 : 90,
      margin: const EdgeInsets.symmetric(
          // horizontal: 5,
          ),
      child: Column(
        mainAxisAlignment: name != null
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
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
          if (name != null)
            Text(
              name!.length > 4 ? "${name!.substring(0, 4)}..." : name!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}

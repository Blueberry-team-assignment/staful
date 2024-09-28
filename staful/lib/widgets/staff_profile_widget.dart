import 'package:flutter/material.dart';

class StaffProfileWidget extends StatelessWidget {
  final String? name;
  final String? imagePath;
  final double? size;

  const StaffProfileWidget({
    super.key,
    this.name,
    this.imagePath,
    this.size = 42,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: name != null
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            width: size,
            height: size,
            child: Image.asset(
              fit: BoxFit.fill,
              imagePath ?? "lib/assets/images/Ellipse 2.png",
            ),
          ),
        ),
        if (name != null)
          Text(
            name!.length > 4 ? "${name!.substring(0, 4)}..." : name!,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}

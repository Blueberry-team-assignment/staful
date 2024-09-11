import 'package:flutter/material.dart';

class StaffProfileWidget extends StatelessWidget {
  final String? name;
  final String imageName;
  final double? size;

  const StaffProfileWidget({
    super.key,
    this.name,
    required this.imageName,
    this.size = 42,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: name != null
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(
                fit: BoxFit.fill,
                "lib/assets/images/$imageName",
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void showCustomBottomSheet({
  required BuildContext context,
  required String title,
  required String subTitle,
  required VoidCallback onSuccess,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return BottomSheetWidget(
        title: title,
        subTitle: subTitle,
        onSuccess: onSuccess,
      );
    },
  );
}

class BottomSheetWidget extends ConsumerWidget {
  final String title;
  final String subTitle;
  final VoidCallback onSuccess;

  const BottomSheetWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
        color: Colors.white,
      ),
      width: MediaQuery.sizeOf(context).width - 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      onSuccess();
                    }, // onSuccess 콜백 호출
                    child: const Text(
                      "삭제",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Theme.of(context).disabledColor),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "취소",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void showBottomSheetWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
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
            const Text(
              '이 스케줄을 삭제하시겠습니까?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '삭제되면 다시 복구되지 않습니다',
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
                      onPressed: () => {},
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
            const SizedBox(
              height: 10,
            ),
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
    },
  );
}

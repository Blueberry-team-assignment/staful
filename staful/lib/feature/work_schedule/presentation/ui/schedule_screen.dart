import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/work_schedule/presentation/provider/calendar_provider.dart';
import 'package:staful/feature/work_schedule/presentation/ui/widgets/date_title_row.dart';
import 'package:staful/ui/layouts/app_layout.dart';
import 'package:staful/feature/work_schedule/presentation/ui/widgets/schedule_table_widget.dart';

class ScheduleScreen extends ConsumerWidget {
  final DateTime date;

  const ScheduleScreen({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: navigateBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        child: Column(
          children: [
            DateTitleRow(date: date),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ScheduleTableWidget(date: date),
            ),
          ],
        ),
      ),
    );
  }
}

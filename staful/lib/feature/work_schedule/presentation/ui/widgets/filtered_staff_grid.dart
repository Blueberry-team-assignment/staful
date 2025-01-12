import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/work_schedule/presentation/provider/calendar_provider.dart';
import 'package:staful/feature/work_schedule/presentation/ui/schedule_screen.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/navigation_helpers.dart';

class FilteredStaffGrid extends ConsumerWidget {
  const FilteredStaffGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarNotifierProvider);

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: calendarState.filteredStaffList.map((staff) {
        return GestureDetector(
          onTap: () => openPage(
            context,
            ScheduleScreen(
              date: calendarState.selectedDay!,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StaffProfileWidget(
              imagePath: staff.image != null
                  ? "lib/assets/images/${staff.image}"
                  : null,
              name: staff.name,
            ),
          ),
        );
      }).toList(),
    );
  }
}

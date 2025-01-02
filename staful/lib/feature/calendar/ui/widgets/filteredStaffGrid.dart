import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/calendar/provider/calendar_provider.dart';
import 'package:staful/ui/screens/calendar/schedule_screen.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/utils/navigation_helpers.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calendarViewModelProvider);

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: state.filteredStaff.map((staff) {
        return GestureDetector(
          onTap: () => openPage(
            context,
            ScheduleScreen(
              date: state.selectedDay,
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

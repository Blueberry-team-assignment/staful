import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/calendar/provider/calendar_provider.dart';
import 'package:staful/feature/schedule_table/domain/build_cell_usecase.dart';
import 'package:staful/feature/schedule_table/domain/scroll_to_current_time_usecase.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class ScheduleTableWidget extends ConsumerWidget {
  final DateTime date;

  const ScheduleTableWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController();
    const double normalCellWidth = 28;
    const double profileCellWidth = 74;

    final state = ref.watch(calendarViewModelProvider);
    final schedules =
        state.filteredStaff.map((staff) => staff.workHours).toList();

    final buildCellUseCase = BuildCellUseCase(normalCellWidth: normalCellWidth);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollToCurrentTime = ScrollToCurrentTimeUsecase(
        controller: scrollController,
        screenWidth: screenWidth,
        cellWidth: normalCellWidth,
        profileWidth: profileCellWidth,
      );
      scrollToCurrentTime.call();
    });

    return Scaffold(
        body: TableView.builder(
      horizontalDetails: ScrollableDetails(
        controller: scrollController,
        direction: AxisDirection.right,
      ),
      cellBuilder: (context, vicinity) => buildCellUseCase.build(
          context, vicinity, schedules, state.filteredStaff, date),
      columnCount: 27,
      pinnedColumnCount: 1,
      columnBuilder: _buildColumnSpan,
      rowCount: schedules.length + 1,
      rowBuilder: _buildRowSpan,
      pinnedRowCount: 1,
    ));
  }

  TableSpan _buildColumnSpan(int index) {
    return TableSpan(
      extent: FixedTableSpanExtent(index == 0 ? 74 : 28),
      foregroundDecoration: index == 0
          ? TableSpanDecoration(
              border: TableSpanBorder(
                trailing: BorderSide(
                  width: 0.5,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            )
          : null,
    );
  }

  TableSpan _buildRowSpan(int index) {
    return TableSpan(
      extent: FixedTableSpanExtent(index == 0 ? 40 : 80),
      padding: index > 0 ? const TableSpanPadding(leading: 5.0) : null,
    );
  }
}

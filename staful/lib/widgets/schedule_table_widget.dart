// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

/// The class demonstrating merged cells in TableView.
class ScheduleTableWidget extends StatefulWidget {
  /// Creates a screen that shows a color palette in the TableView widget.
  const ScheduleTableWidget({super.key});

  @override
  State<ScheduleTableWidget> createState() => ScheduleTableWidgetState();
}

class ScheduleTableWidgetState extends State<ScheduleTableWidget> {
  final List<int> _numbers = List.generate(26, (index) => index - 1);

  final schedules = [
    [],
    ["10:00", "20:00"],
    ["08:00", "20:00"],
    ["14:00", "24:00"]
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
        body: TableView.builder(
      cellBuilder: _buildCell,
      columnCount: 26,
      pinnedColumnCount: 1,
      columnBuilder: _buildColumnSpan,
      rowCount: schedules.length,
      rowBuilder: _buildRowSpan,
      pinnedRowCount: 1,
    ));
  }

  TableViewCell _buildCell(BuildContext context, TableVicinity vicinity) {
    if (vicinity.row == 0) {
      if (vicinity.column == 0) return const TableViewCell(child: Text(""));
      final int number = _numbers[vicinity.column];
      return TableViewCell(
        child: SizedBox(
          height: 10,
          width: 50,
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      );
    }

    if (vicinity.column == 0) {
      return const TableViewCell(
        child: Center(
          child: StaffProfileWidget(
            imageName: "Ellipse 3.png",
            name: "매니저",
          ),
        ),
      );
    }

    final int start = _getTimeIndex(schedules[vicinity.yIndex][0]) + 1;
    final int end = _getTimeIndex(schedules[vicinity.yIndex][1]) + 1;
    if (vicinity.column == start) {
      return TableViewCell(
        columnMergeStart: start,
        columnMergeSpan: end - start + 1, // Span for merging columns
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColoredBox(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  "${schedules[vicinity.yIndex][0]} - ${schedules[vicinity.yIndex][1]}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return const TableViewCell(child: SizedBox.shrink());
  }

  TableSpan _buildColumnSpan(int index) {
    return TableSpan(
      extent: FixedTableSpanExtent(index == 0 ? 74 : 28),
      foregroundDecoration: index == 0
          ? const TableSpanDecoration(
              border: TableSpanBorder(
                trailing: BorderSide(
                  width: 5,
                  color: Colors.blue,
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

  int _getTimeIndex(String time) {
    final int hour = int.parse(time.split(":")[0]);
    return hour;
  }
}

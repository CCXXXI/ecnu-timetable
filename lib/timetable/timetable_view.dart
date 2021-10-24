import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/database.dart';
import 'timetable_logic.dart';

class TimetablePage extends StatelessWidget {
  TimetablePage({Key? key}) : super(key: key);

  final logic = Get.put(TimetableLogic());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: courses.listenable(),
      builder: (_, __, ___) {
        if (courses.isEmpty) {
          return const TextButton(
            onPressed: TimetableLogic.openMenu,
            child: Text('NO DATA'),
          );
        } else {
          final areas_ = TimetableLogic.areas;
          final weekdays_ = TimetableLogic.weekdays;
          final units_ = TimetableLogic.units;
          final areasList = TimetableLogic.areasRaw.expand((e) => e).toList();

          return LayoutGrid(
            areas: areas_,
            columnSizes: [auto, ...weekdays_.map((i) => 1.fr)],
            rowSizes: [auto, ...units_.map((i) => 1.fr)],
            children: [
              ...weekdays_.map(
                (i) => Center(
                  child: FittedBox(
                    child: Text(
                      ['一', '二', '三', '四', '五', '六', '日'][i],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ).inGridArea('$i-x'),
              ),
              ...units_.map(
                (i) => Center(
                  child: FittedBox(
                    child: Text(
                      [
                        '8:00\n8:45',
                        '8:50\n9:35',
                        '9:50\n10:35',
                        '10:40\n11:25',
                        '11:30\n12:15',
                        '13:00\n13:45',
                        '13:50\n14:35',
                        '14:50\n15:35',
                        '15:40\n16:25',
                        '16:30\n17:15',
                        '18:00\n18:45',
                        '18:50\n19:35',
                        '19:40\n20:25',
                      ][i],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ).inGridArea('x-$i'),
              ),
              for (final course in courses.values)
                for (final period in course.periods!)
                  if (areasList.contains('${period.weekday}-${period.unit}'))
                    Center(
                      child: Text(
                        '${course.courseName!.length <= 12 ? course.courseName : course.courseName!.substring(0, 11) + '...'}\n'
                        '${course.roomName! + course.specialRoom!}\n'
                        '${course.weeks!.sublist(1, 10).map((e) => e ? 'o' : 'x').join()}\n'
                        '${course.weeks!.sublist(10, 19).map((e) => e ? 'o' : 'x').join()}',
                        textAlign: TextAlign.center,
                      ),
                    ).inGridArea(
                      '${period.weekday}-${period.unit}',
                    ),
            ],
          );
        }
      },
    );
  }
}

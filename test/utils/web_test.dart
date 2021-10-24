import 'package:ecnu_timetable/utils/web.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'sucker',
    () => expect(
      Api.randomSucker,
      isNotEmpty,
    ),
  );

  test(
    'version url',
    () => expect(
      Url.version('0.1.0'),
      'https://github.com/CCXXXI/ecnu_timetable/releases/tag/v0.1.0',
    ),
  );
}

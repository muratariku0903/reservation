import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../domain/acceptable/model/holiday.dart';
import '../../../domain/acceptable/repository/holiday_repository_base.dart';

class HolidayRepositoryImpl implements HolidayRepositoryBase {
  @override
  Future<Map<int, Holiday>> fetch(int officeCode, DateTime day) async {
    const endpoint = 'http://localhost:3000/holiday/';
    Uri url = Uri.parse(endpoint);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<int, Holiday> res = {};
      List<dynamic> jsons = json.decode(utf8.decode(response.bodyBytes));
      for (dynamic json in jsons) {
        Holiday holiday = Holiday.fromJson(json);
        List<String> list = holiday.date.split('-');
        DateTime holidayDate = DateTime(
          int.parse(list[0]),
          int.parse(list[1]),
          int.parse(list[2].substring(0, 2)),
        );

        DateTime lastBusinessDay = day.add(const Duration(days: 60));

        if (holiday.officeCode != officeCode) continue;
        if (!holidayDate.isAfter(DateTime(day.year, day.month - 2, 0))) continue;
        if (!holidayDate.isBefore(
            DateTime(lastBusinessDay.year, lastBusinessDay.month + 1, 0).add(const Duration(days: 1)))) continue;

        res[holidayDate.millisecondsSinceEpoch] = holiday;
      }
      return res;
    } else {
      throw Exception('Failed to fetch holiday list.');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../domain/acceptable/model/time_acceptable.dart';
import '../../../domain/acceptable/repository/time_acceptable_repository_base.dart';

class TimeAcceptableRepositoryImpl implements TimeAcceptableRepositoryBase {
  @override
  // dayは翌営業日になる
  Future<Map<String, TimeAcceptable>> fetch(int officeCode, DateTime day) async {
    const endpoint = 'http://localhost:3000/acceptableList/';
    Uri url = Uri.parse(endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, TimeAcceptable> res = {};
      List<dynamic> jsons = json.decode(utf8.decode(response.bodyBytes));
      for (dynamic json in jsons) {
        TimeAcceptable timeAcceptable = TimeAcceptable.fromJson(json);
        List<String> list = timeAcceptable.date.split('-');
        DateTime timeAcceptableDate = DateTime(
          int.parse(list[0]),
          int.parse(list[1]),
          int.parse(list[2].substring(0, 2)),
        );

        DateTime lastBusinessDay = day.add(const Duration(days: 60));

        if (timeAcceptable.officeCode != officeCode) continue;
        if (!timeAcceptableDate.isAfter(DateTime(day.year, day.month - 2, 0))) continue;
        if (!timeAcceptableDate.isBefore(
            DateTime(lastBusinessDay.year, lastBusinessDay.month + 1, 0).add(const Duration(days: 1)))) continue;

        res['${timeAcceptable.date}_${timeAcceptable.start}_${timeAcceptable.end}'] = timeAcceptable;
      }
      return res;
    } else {
      throw Exception('Failed to fetch acceptable list.');
    }
  }
}

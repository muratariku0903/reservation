import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../domain/acceptable/model/holiday.dart';
import '../../../domain/acceptable/repository/holiday_repository_base.dart';

class HolidayRepositoryImpl implements HolidayRepositoryBase {
  @override
  Future<List<Holiday>> fetch(int officeCode) async {
    const endpoint = 'http://localhost:3000/holiday/';
    Uri url = Uri.parse(endpoint);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Holiday> list = [];
      List<dynamic> jsons = json.decode(utf8.decode(response.bodyBytes));
      for (dynamic json in jsons) {
        Holiday holiday = Holiday.fromJson(json);
        if (holiday.officeCode == officeCode) {
          list.add(holiday);
        }
      }
      return list;
    } else {
      throw Exception('Failed to fetch holiday list.');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../domain/acceptable/model/time_acceptable.dart';
import '../../../domain/acceptable/repository/acceptable_repository_base.dart';

class AcceptableRepositoryImpl implements AcceptableRepositoryBase {
  @override
  // TODO: 日付を指定して取ってくる。当月が11月ならば10月と12月を取ってくる。多分pathパラメーターで指定するんだけど今回は内部でやる
  Future<List<TimeAcceptable>> fetch(int officeCode) async {
    const endpoint = 'http://localhost:3000/acceptableList/';
    Uri url = Uri.parse(endpoint);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<TimeAcceptable> list = [];
      List<dynamic> jsons = json.decode(utf8.decode(response.bodyBytes));
      for (dynamic json in jsons) {
        TimeAcceptable timeAcceptable = TimeAcceptable.fromJson(json);
        if (timeAcceptable.officeCode == officeCode) {
          list.add(timeAcceptable);
        }
      }
      return list;
    } else {
      throw Exception('Failed to fetch acceptable list.');
    }
  }
}

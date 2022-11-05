import 'package:logger/logger.dart';

import '../../domain/acceptable/model/time_acceptable.dart';
import '../../domain/acceptable/repository/acceptable_repository_base.dart';

class AcceptableService {
  AcceptableService({required this.repository});

  final AcceptableRepositoryBase repository;
  final Logger logger = Logger();

  Future<List<TimeAcceptable>> fetch(int officeCode) async {
    List<TimeAcceptable> acceptableList;

    try {
      acceptableList = await repository.fetch(officeCode);
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    return acceptableList;
  }
}

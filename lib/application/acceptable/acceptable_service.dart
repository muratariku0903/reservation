import 'package:logger/logger.dart';

import '../../domain/acceptable/model/acceptable.dart';
import '../../domain/acceptable/model/holiday.dart';
import '../../domain/acceptable/model/time_acceptable.dart';
import '../../domain/acceptable/repository/holiday_repository_base.dart';
import '../../domain/acceptable/repository/time_acceptable_repository_base.dart';

class AcceptableService {
  AcceptableService({
    required this.timeAcceptableRepository,
    required this.holidayRepository,
  });

  final TimeAcceptableRepositoryBase timeAcceptableRepository;
  final HolidayRepositoryBase holidayRepository;
  final Logger logger = Logger();

  Future<Acceptable> fetch(int officeCode, DateTime day) async {
    Acceptable acceptable;

    try {
      Map<String, TimeAcceptable> timeAcceptableList = await timeAcceptableRepository.fetch(officeCode, day);
      Map<int, Holiday> holidayList = await holidayRepository.fetch(officeCode, day);
      acceptable = Acceptable(
        officeCode: officeCode,
        timeAcceptableList: timeAcceptableList,
        holidayList: holidayList,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    return acceptable;
  }
}

import 'package:logger/logger.dart';

import '../../domain/acceptable/model/acceptable.dart';
import '../../domain/acceptable/repository/acceptable_repository_base.dart';

class UserService {
  UserService({required this.repository});

  final AcceptableRepositoryBase repository;
  final Logger logger = Logger();

  Future<Map<int, DateAcceptable>?> fetch(String id) async {
    Map<int, DateAcceptable>? res;

    try {
      res = await repository.fetch(id);
    } catch (e) {
      logger.e(e);
      rethrow;
    }

    return res;
  }
}

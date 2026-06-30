import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/result/result.dart';

// TODO (docs)
abstract class EnvService {
  Future<Result<void, Exception>> load();
  Result<String?, BaseException> get(String key);
}

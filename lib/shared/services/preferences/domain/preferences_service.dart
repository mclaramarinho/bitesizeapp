import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/result/result.dart';

// TODO (docs)
abstract class PreferencesService {
  Future<Result<void, BaseException>> set<T>(String key, T value);
  Future<Result<T, BaseException>> get<T>(String key);
  Future<Result<void, BaseException>> clear(String key);
}

import 'package:adhd_app/shared/utils/exceptions/app/app_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/env/env_exception.dart';
import 'package:adhd_app/shared/utils/logger/logger.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

abstract class EnvService {
  Future<Result<void, Exception>> load();
  Result<String?, BaseException> get(String key);
}

// TODO (docs)
@Injectable(as: EnvService)
class EnvServiceImpl implements EnvService {
  static final _instance = DotEnv();
  static final Map<String, String> _envFiles = {"default": "./assets/.env"};
  static const Logger _logger = Logger(location: "EnvServiceImpl");
  @override
  Future<Result<void, Exception>> load() async {
    try {
      await _instance.load(fileName: _envFiles["default"]!);
      return Ok(null);
    } on Exception catch (ex) {
      _logger.error(
        "Error loading .env.",
        additionalInfo: ex,
        includeStackTrace: true,
      );
      return Error(UnknownErrorException());
    }
  }

  @override
  Result<String?, BaseException> get(String key) {
    try {
      final val = _instance.get(key);
      return Ok(val);
    } on Exception catch (ex) {
      _logger.error(
        "Error loading variable from file.",
        additionalInfo: ex,
        includeStackTrace: true,
      );
      return Error(
        ex is AssertionError
            ? VariableNotFoundException()
            : UnknownErrorException(),
      );
    }
  }
}

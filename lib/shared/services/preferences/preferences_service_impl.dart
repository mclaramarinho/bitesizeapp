import 'package:adhd_app/shared/services/preferences/preferences_service.dart';
import 'package:adhd_app/shared/utils/exceptions/app/app_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';
import 'package:adhd_app/shared/utils/exceptions/preferences/preferences_exception.dart';
import 'package:adhd_app/shared/utils/logger/logger.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: PreferencesService)
class PreferencesServiceImpl implements PreferencesService {
  late SharedPreferencesAsync? _instance;

  PreferencesServiceImpl() {
    _instance = SharedPreferencesAsync();
  }

  static const Logger _logger = Logger(location: "PreferencesServiceImpl");

  @override
  Future<Result<void, BaseException>> set<T>(String key, T value) async {
    try {
      if (T is bool) {
        await _instance!.setBool(key, value as bool);
      } else if (T is double) {
        await _instance!.setDouble(key, value as double);
      } else if (T is int) {
        await _instance!.setInt(key, value as int);
      } else if (T is String) {
        await _instance!.setString(key, value as String);
      } else {
        return Error(UnsupportedPreferenceType());
      }

      return Ok(null);
    } catch (ex) {
      if (ex is TypeError) {
        return Error(IncorrectPreferenceType());
      } else {
        _logger.error(
          "Unexpected error",
          includeStackTrace: true,
          additionalInfo: ex,
        );
        return Error(UnknownErrorException());
      }
    }
  }

  @override
  Future<Result<T, BaseException>> get<T>(String key) async {
    try {
      _ensureInstanceInitiated();
      T val;
      if (T is bool) {
        val = await _instance!.getBool(key) as T;
      } else if (T is double) {
        val = await _instance!.getDouble(key) as T;
      } else if (T is int) {
        val = await _instance!.getInt(key) as T;
      } else if (T is String) {
        val = await _instance!.getString(key) as T;
      } else {
        return Error(UnsupportedPreferenceType());
      }
      return Ok(val);
    } catch (ex) {
      if (ex is TypeError) {
        return Error(IncorrectPreferenceType());
      } else {
        _logger.error(
          "Unexpected error",
          includeStackTrace: true,
          additionalInfo: ex,
        );
        return Error(UnknownErrorException());
      }
    }
  }

  @override
  Future<Result<void, BaseException>> clear(String key) async {
    _ensureInstanceInitiated();
    try {
      await _instance!.clear();
      return Ok(null);
    } catch (ex) {
      _logger.error(
        "Unexpected error",
        includeStackTrace: true,
        additionalInfo: ex,
      );
      return Error(UnknownErrorException());
    }
  }

  bool _ensureInstanceInitiated() {
    final isInit = _instance != null;
    if (!isInit) {
      throw PreferencesInstanceNotInitialized();
    }
    return true;
  }
}

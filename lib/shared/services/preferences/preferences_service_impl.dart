import 'package:adhd_app/shared/services/preferences/preferences_service.dart';
import 'package:adhd_app/shared/utils/exceptions/preferences/preferences_exception.dart';
import 'package:adhd_app/shared/utils/logger/logger.dart';
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
  Future<void> set<T>(String key, T value) async {
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
        throw UnsupportedPreferenceType();
      }
    } catch (ex) {
      if (ex is TypeError) {
        throw IncorrectPreferenceType();
      } else {
        _logger.error("Unexpected error", includeStackTrace: true);
        rethrow;
      }
    }
  }

  @override
  Future<T> get<T>(String key) async {
    try {
      _ensureInstanceInitiated();
      if (T is bool) {
        return await _instance!.getBool(key) as T;
      } else if (T is double) {
        return await _instance!.getDouble(key) as T;
      } else if (T is int) {
        return await _instance!.getInt(key) as T;
      } else if (T is String) {
        return await _instance!.getString(key) as T;
      } else {
        throw UnsupportedPreferenceType();
      }
    } catch (ex) {
      if (ex is TypeError) {
        throw IncorrectPreferenceType();
      } else {
        _logger.error("Unexpected error", includeStackTrace: true);
        rethrow;
      }
    }
  }

  @override
  Future<void> clear(String key) async {
    _ensureInstanceInitiated();
    return await _instance!.clear();
  }

  bool _ensureInstanceInitiated() {
    final isInit = _instance != null;
    if (!isInit) {
      throw PreferencesInstanceNotInitialized();
    }
    return true;
  }
}

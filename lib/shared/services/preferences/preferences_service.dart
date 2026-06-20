abstract class PreferencesService {
  Future<void> set<T>(String key, T value);
  Future<T> get<T>(String key);
  Future<void> clear(String key);
}

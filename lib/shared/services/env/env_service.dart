import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

abstract class EnvService {
  Future<void> load();
}

@Injectable(as: EnvService)
class EnvServiceImpl implements EnvService {
  static final _instance = DotEnv();
  static final Map<String,String> _envFiles = {
    "default": "./assets/.env",
  };

  @override
  Future<void> load() async  {
    await _instance.load(fileName: _envFiles["default"]!);
  }

  String? get(String key) => _instance.get(key);
}

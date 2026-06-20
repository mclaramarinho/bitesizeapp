import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/services/auth/auth_service.dart';

enum AppDbCollections {
  users(path: "users");

  final String path;
  final bool private;
  const AppDbCollections({required this.path, this.private = true});

  static String? get _currentUserId =>
      getIt.get<AuthService>().currentUser?.uid;

  String buildPathWithParams(List<String>? params) {
    final pt = "/$path${private ? "/$_currentUserId" : ''}";
    if (params == null || params.isEmpty) return pt;
    return "$pt/${params.map((p) => '$p/')}";
  }
}

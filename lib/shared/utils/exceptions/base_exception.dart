abstract class BaseException implements Exception {
  final String _message;

  String get message => _message;

  const BaseException({required String message}) : _message = message;
}

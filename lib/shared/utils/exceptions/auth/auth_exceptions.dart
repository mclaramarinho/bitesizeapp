abstract class AuthException implements Exception {
  String get message;
}

class UserAlreadyExistsException implements AuthException {
  final String _message;

  UserAlreadyExistsException([
    this._message = 'The account already exists for that email.',
  ]);

  @override
  String get message => _message;
}

class WeakPasswordException implements AuthException {
  final String _message;

  WeakPasswordException([
    this._message = 'The password provided is too weak.',
  ]);

  @override
  String get message => _message;
}

class GenericAuthException implements AuthException {
  final String _message;

  GenericAuthException([
    this._message = 'An unknown error occurred.',
  ]);

  @override
  String get message => _message;
}
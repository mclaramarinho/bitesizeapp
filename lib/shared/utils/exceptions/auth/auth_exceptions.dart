import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

// TODO (localize)
// TODO (docs)
abstract class AuthException extends BaseException {
  const AuthException({required super.message});
}

class UserAlreadyExistsException extends AuthException {
  const UserAlreadyExistsException()
    : super(message: 'The account already exists for that email.');
}

class WeakPasswordException extends AuthException {
  const WeakPasswordException()
    : super(message: 'The password provided is too weak.');
}

class GenericAuthException extends AuthException {
  const GenericAuthException() : super(message: 'An unknown error occurred.');
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException()
    : super(message: 'Invalid credentials! Check your email and password.');
}

class UserDoesNotExistException extends AuthException {
  const UserDoesNotExistException() : super(message: 'User does not exist.');
}

class UserDisabledException extends AuthException {
  const UserDisabledException()
    : super(message: "User has been disabled. Contact admin to know more.");
}

class InvalidActionCodeException extends AuthException {
  const InvalidActionCodeException()
    : super(message: "This code has expired or is not correct.");
}

import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

// TODO - localize
abstract class NetworkException extends BaseException {
  const NetworkException({required super.message});
}

class TooManyRequestsException extends NetworkException {
  const TooManyRequestsException()
    : super(message: "Too many requests. Wait before trying again.");
}

class NetworkRequestFailedException extends NetworkException {
  const NetworkRequestFailedException()
    : super(
        message:
            "There was a connection error. Make sure you are connected to the internet.",
      );
}

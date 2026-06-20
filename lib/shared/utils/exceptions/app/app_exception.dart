import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

abstract class AppException extends BaseException {
  const AppException({required super.message});
}

// TODO (localize)
// TODO (docs)
class InternalErrorException extends AppException {
  const InternalErrorException()
    : super(
        message: "Internal error occurred. Contact app admin to know more.",
      );
}

class UnknownErrorException extends AppException {
  const UnknownErrorException()
    : super(message: "Unknown error occurred. Contact app admin to know more.");
}

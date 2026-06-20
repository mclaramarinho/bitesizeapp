import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

abstract class DbException extends BaseException {
  const DbException({required super.message});
}

class ErrorWritingDbException extends DbException {
  const ErrorWritingDbException()
    : super(message: "Error writing on database.");
}

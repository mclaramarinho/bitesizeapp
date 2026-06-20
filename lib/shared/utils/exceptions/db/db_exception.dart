import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

// TODO (localize)
// TODO (docs)
abstract class DbException extends BaseException {
  const DbException({required super.message});
}

class ErrorWritingDbException extends DbException {
  const ErrorWritingDbException()
    : super(message: "Error writing on database.");
}

import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

// TODO (localize)
// TODO (docs)
abstract class EnvException extends BaseException {
  const EnvException({required super.message});
}

class VariableNotFoundException extends EnvException {
  const VariableNotFoundException()
    : super(message: "Variable not found in file.");
}

import 'package:adhd_app/shared/utils/exceptions/base_exception.dart';

// TODO (localize)
// TODO (docs)
abstract class PreferencesException extends BaseException {
  const PreferencesException({required super.message});
}

class PreferencesInstanceNotInitialized extends PreferencesException {
  const PreferencesInstanceNotInitialized()
    : super(message: "Preferences Service instance was not initialized.");
}

class UnsupportedPreferenceType extends PreferencesException {
  const UnsupportedPreferenceType()
    : super(
        message:
            "Preferences Service can only supports int, bool, double and string.",
      );
}

class IncorrectPreferenceType extends PreferencesException {
  const IncorrectPreferenceType()
    : super(message: "The value for this preference is not of type T.");
}

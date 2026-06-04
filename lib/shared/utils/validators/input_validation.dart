import 'package:adhd_app/shared/di/injection.dart';
import 'package:adhd_app/shared/utils/extensions/context_or_null.dart';
import 'package:adhd_app/shared/utils/extensions/string.dart';
import 'package:adhd_app/shared/utils/navigation/router.dart';

class InputValidation {
  static String? validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Please enter your email';

    final email = v.trim();
    final emailRegex = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$");

    if (!emailRegex.hasMatch(email)) return 'Enter a valid email';
    return null;
  }

  static String? validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Enter a password';
    if (v.length < 8) return 'Password must be at least 8 characters';
    // TODO - add rule (special char - at least 1)
    // Accepted: !@#$%&*()-_+=.,

    // TODO - add rule (uppercase letter - at least 1)

    // TODO - add rule (lowercase letter - at least 1)
    return null;
  }

  static String? validateConfirm(String? confirmValue, String? passwordValue) {
    if (confirmValue != passwordValue) return 'Passwords do not match';
    return null;
  }

  static String? validateName(String? v) {
    final context = getIt.get<AppRouter>().context;
    if (context == null) return null;
    return (v.isNullOrEmpty()) ? context.loc.enter_name : null;
  }

  static String? validateBirthdate(DateTime? birthdate) {
    final context = getIt.get<AppRouter>().context;
    if (context == null) return null;
    return (birthdate == null) ? context.loc.select_birthdate : null;
  }

  static String? validateCountry(String? v) {
    final context = getIt.get<AppRouter>().context;
    if (context == null) return null;

    return (v.isNullOrEmpty()) ? context.loc.select_country : null;
  }
}

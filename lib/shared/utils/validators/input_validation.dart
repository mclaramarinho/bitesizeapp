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
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? validateConfirm(String? confirmValue, String? passwordValue) {
    if (confirmValue != passwordValue) return 'Passwords do not match';
    return null;
  }
}
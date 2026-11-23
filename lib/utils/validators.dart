class Validators {
  static String? validateName(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) return 'Full name is required.';
    if (name.length < 2) return 'Enter a valid full name.';
    return null;
  }

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email address is required.';
    final pattern = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!pattern.hasMatch(email)) return 'Enter a valid email address.';
    return null;
  }

  static String? validatePhone(String? value) {
    final phone = value?.trim() ?? '';
    if (phone.isEmpty) return 'Phone number is required.';
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 7 || digits.length > 15) {
      return 'Enter a valid phone number.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required.';
    if (password.length < 8) return 'Password must be at least 8 characters.';
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Include at least one uppercase letter.';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Include at least one lowercase letter.';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Include at least one number.';
    }
    return null;
  }

  static String? validateSignInPassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required.';
    if (password.length < 8) return 'Password must be at least 8 characters.';
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return 'Please confirm your password.';
    }
    if (password != confirm) return 'Passwords do not match.';
    return null;
  }
}

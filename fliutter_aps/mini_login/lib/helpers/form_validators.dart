class ValidationFieldResult {
  final bool isValid;
  final String? message;
  const ValidationFieldResult({required this.isValid, this.message});
}

class FormValidators {
  static ValidationFieldResult isValidUsername(String username) {
    if (username.isEmpty) {
      return ValidationFieldResult(
        isValid: false,
        message: 'Username is empty',
      );
    } else if (username.length < 2) {
      return ValidationFieldResult(
        isValid: false,
        message: 'Please enter a valid username',
      );
    }
    return ValidationFieldResult(isValid: true);
  }

  static ValidationFieldResult isValidPassword(String password) {
    if (password.isEmpty) {
      return ValidationFieldResult(
        isValid: false,
        message: 'Password is empty',
      );
    } else if (password.length < 8) {
      return ValidationFieldResult(
        isValid: false,
        message: 'Password need at least 8 characters',
      );
    }
    return ValidationFieldResult(isValid: true);
  }
}

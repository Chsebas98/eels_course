class ValidationFieldResult {
  final bool isValid;
  final String? message;

  const ValidationFieldResult({required this.isValid, this.message});
}

class FormValidators {
  static ValidationFieldResult validateName(String username) {
    // Verifica el vació del input
    if (username == '') {
      return const ValidationFieldResult(
        isValid: false,
        message: "El nombre no puede estar vacío",
      );
    }

    // Verifica longitud mínima de 8 caracteres
    if (username.length < 3) {
      return const ValidationFieldResult(
        isValid: false,
        message: "Por favor ingrese un nombre válido",
      );
    }

    return const ValidationFieldResult(isValid: true);
  }

  static ValidationFieldResult validatePassword(String password) {
    if (password == '') {
      return const ValidationFieldResult(
        isValid: false,
        message: 'La contraseña no puede estar vacía',
      );
    }
    if (password.length < 8) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña debe tener al menos 8 caracteres",
      );
    }

    // Verifica longitud máxima de 20 caracteres
    if (password.length > 20) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña no puede tener más de 20 caracteres",
      );
    }
    return const ValidationFieldResult(isValid: true);
  }

  static ValidationFieldResult validateEmail(String mail) {
    //Mail vacío
    if (mail == '') {
      return const ValidationFieldResult(
        isValid: false,
        message: 'El email no puede estar vacío',
      );
    }

    //Validación mail regex
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(mail)) {
      return const ValidationFieldResult(
        isValid: false,
        message: 'Por favor ingrese un correo válido',
      );
    }
    return const ValidationFieldResult(isValid: true);
  }

  static ValidationFieldResult validateValidPassword(String password) {
    // Verifica el vacío de password
    if (password == '') {
      return const ValidationFieldResult(
        isValid: false,
        message: 'La contraseña no puede estar vacía',
      );
    }

    // Verifica longitud mínima de 8 caracteres
    if (password.length < 8) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña debe tener al menos 8 caracteres",
      );
    }

    // Verifica longitud máxima de 20 caracteres
    if (password.length > 20) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña no puede tener más de 20 caracteres",
      );
    }

    // Verifica al menos un número
    final hasNumber = RegExp(r'\d');
    if (!hasNumber.hasMatch(password)) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña debe contener al menos un número",
      );
    }

    // Verifica al menos una letra minúscula
    final hasLowercase = RegExp(r'[a-z]');
    if (!hasLowercase.hasMatch(password)) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña debe contener al menos una letra minúscula",
      );
    }

    // Verifica al menos una letra mayúscula
    final hasUppercase = RegExp(r'[A-Z]');
    if (!hasUppercase.hasMatch(password)) {
      return const ValidationFieldResult(
        isValid: false,
        message: "La contraseña debe contener al menos una letra mayúscula",
      );
    }

    // Verifica al menos un carácter especial (@, #, +, $, %)
    final hasSpecialChar = RegExp(r'[!#$%&()*+,-./:;<=>?@\\_,]');
    if (!hasSpecialChar.hasMatch(password)) {
      //la r se pone para que el string del mensaje que contiene caracteres especiales.
      //El prefijo r convierte el string en un raw string,
      //lo que hace que Dart ignore cualquier escape dentro de la cadena, esto es por el signo $.
      return const ValidationFieldResult(
        isValid: false,
        message:
            r"La contraseña debe contener al menos un carácter especial (@,#,+,%,$)",
      );
    }

    //Si todo está posi regresa true
    return const ValidationFieldResult(isValid: true);
  }
}

import 'package:scanner_app/core/models/models.dart';

class Formvalidators {
  static ValidationFieldResult isValidMail(String mail) {
    bool hasError = false;
    String message = '';
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (mail == '') {
      hasError = true;
      message = 'No puede estar vacío';
    } else if (!emailRegex.hasMatch(mail)) {
      hasError = true;
      message = 'No es un correo válido';
    } else if (mail.length > 20) {
      hasError = true;
      message = 'No puede tener más de 20 caracteres';
    } else if (mail.length < 12) {
      hasError = true;
      message = 'No debe tener menos de 12 caracteres';
    }

    return ValidationFieldResult(isValid: !hasError, message: message);
  }

  static ValidationFieldResult isValidPassword(String psw) {
    bool hasError = false;
    String message = '';

    final oneNumber = RegExp(r'[0-9]');

    if (psw.isEmpty) {
      hasError = true;
      message = 'No puede estar vacío';
    } else if (psw.length < 8) {
      hasError = true;
      message = 'No debe tener menos de 8 caracteres';
    } else if (psw.length > 20) {
      hasError = true;
      message = 'No debe tener mas de 20 caracteres';
    } else if (!oneNumber.hasMatch(psw)) {
      hasError = true;
      message = 'Debe contener al menos un número';
    }
    return ValidationFieldResult(isValid: !hasError, message: message);
  }

  static ValidationFieldResult isValidCelu(String celu) {
    bool hasError = false;
    String message = '';

    final onlyNumbers = RegExp(r'^[0-9]+$');

    if (celu.isEmpty) {
      hasError = true;
      message = 'No puede estar vacío';
    } else if (celu.length != 10) {
      hasError = true;
      message = 'Ingrese un telefono valido';
    } else if (!onlyNumbers.hasMatch(celu)) {
      hasError = true;
      message = 'Solo pueden haber números';
    }
    return ValidationFieldResult(isValid: !hasError, message: message);
  }

  static ValidationFieldResult generalValidations(String value) {
    bool hasError = false;
    String message = '';

    if (value.isEmpty) {
      hasError = true;
      message = 'No puede estar vacio';
    } else if (value.length > 40) {
      hasError = true;
      message = 'No puede superar los 40 caracteres';
    } else if (value.length < 10) {
      hasError = true;
      message = 'Debe tener al menos 10 caracteres';
    }

    return ValidationFieldResult(isValid: !hasError, message: message);
  }
}

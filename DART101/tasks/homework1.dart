// Ejercicio 1: Calculadora de descuentos
// Crea un programa que calcule el precio final de un producto aplicando un descuento. Si el cliente es
// 'VIP' y el precio es mayor o igual a 100, recibe 20% de descuento, si no, 10%. Los clientes normales
// reciben 5% solo si el precio es mayor o igual a 100.
// Tip: Usa condicionales anidados y variables de tipo double para manejar precios.
// void main() {
//   final double productPrice = 145.5;
//   final bool isVip = true;
//   final List<double> codDescuento = [0.05, 0.10, 0.20];

//   double total = 0.0;

//   if (isVip) {
//     total = productPrice >= 100
//         ? productPrice - (productPrice * codDescuento[2])
//         : productPrice - (productPrice * codDescuento[1]);
//   } else {
//     total = productPrice >= 100
//         ? productPrice - (productPrice * codDescuento[0])
//         : productPrice;
//   }
//   print(
//     "Cliente tipo ${isVip ? 'VIP' : 'Normal'} paga: $total con ${productPrice >= 100
//         ? isVip
//               ? '20%'
//               : '5%'
//         : isVip
//         ? '10%'
//         : '0%'}",
//   );
// }

// Ejercicio 2: Conversión de temperatura
// Crea un programa que convierta una temperatura en grados Celsius a Fahrenheit o Kelvin. El usuario
// debe indicar la escala ('F' o 'K').
// Las fórmulas son:
// • Fahrenheit = (Celsius × 9 / 5) + 32
// • Kelvin = Celsius + 273.15
// Tip: Usa operadores aritméticos para las fórmulas y condicionales para validar la escala.

// void main() {
//   final double grades = 20.0;

//   final double gradesKelvin = (grades + 273.15);
//   final double gradesFarenheit = (grades * 9 / 5) + 32;

//   print(
//     "Temperatura original $grades °C son $gradesKelvin °K y $gradesFarenheit °F",
//   );
// }

// Ejercicio 3: Verificación de contraseña segura
// Escribe un programa que valide si una contraseña es segura. Debe tener al menos 8 caracteres, una
// mayúscula, un número y un carácter especial.
// Tip: Usa expresiones regulares con contains() para validar letras, números y símbolos.

void main() {
  final String password = "123";

  final hasUppercase = RegExp(r'[A-Z]');
  final hasSpecialChar = RegExp(r'[!#$%&()*+,-./:;<=>?@\\_,]');
  final hasNumber = RegExp(r'\d');
  bool isValid = false;
  if (password == "") {
    isValid = false;
  } else if (password.length > 20) {
    isValid = false;
  } else if (password.length <= 8) {
    isValid = false;
  } else if (!hasUppercase.hasMatch(password)) {
    isValid = false;
  } else if (!hasSpecialChar.hasMatch(password)) {
    isValid = false;
  } else if (!hasNumber.hasMatch(password)) {
    isValid = false;
  } else {
    isValid = true;
  }
  print('PSw es valida: $isValid');
}

void main() {
  print('Hola mundo');

  // Tipo de dato Entero - Comentarios
  // int - entero
  int edad = 29;
  print("EDAD");
  print(edad);

  // crear una variable y le llamen precio = 20.20;
  // double - decimales
  double precio = 20.20;
  print("PRECIO");
  print(precio);

  // Texto o cadenas de texto
  // String
  String nombre = "Richar";
  print(nombre);
  // crear una variable que se llame saludo e imprimir eso
  String saludo = "Hola Mundo";
  print(saludo);

  // Hola mi nombre es Richar y tengo 29 años
  // Concatenación de strings
  // + Suma
  // $
  String saludo1 =
      "Hola mi nombre es " + nombre + " y tengo " + edad.toString() + " años";
  print(saludo1);

  String saludo2 = "Hola mi nombre es $nombre y tengo $edad años";
  print(saludo2);

  String costo = "El valor de la cuenta es: ${precio + 2.2}";

  print(costo);
  
  // Boleanos - expresar verdadero o falso
  // bool - true y false
  bool a = true;
  bool b = false; 
  print(a);
  print(b);
  
}
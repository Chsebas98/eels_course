void main() {
  // Crear una variable con el tipo de dato - tipo explícito
  int age = 29;
  print(age);
  print(age.runtimeType);

  // Variables que infieran el tipo
  var nombre = "Richar";
  nombre = "Santiago";
  print(nombre);
  print(nombre.runtimeType);

  // Inmutabilidad - final
  final direccion = "Latacunga";
  print(direccion);

  // Constantes - const
  const pi = 3.1415;
  print(pi);

  // Representar el estado de un interruptor ON - OFF
  // true es encendido ON y. false es Apagado OFF
  bool interruptor = true;
  print(interruptor);

  // Represente una lista de compras
  String compras = "Huevos, Pan, Azucar";
  print(compras);

  // Datos de un usuario
  String nombreNuevo = "Richar";
  String apellido = "Cangui";
  String direccionNuevo = "Latacunga";
  int edad = 29;
  double altura = 1.76;
  double peso = 100.4;
  print(
    "Los datos del usuario son: $nombreNuevo, $apellido, $direccionNuevo, $edad años, $altura metros, $peso LB",
  );
  
  // Listas 
  List<String> listaDeCompras = ["Huevos","Pan","Azucar"]; 
  print(listaDeCompras);
  // Oye quiero saber si la lista esta vacía
  bool estaVacia = listaDeCompras.isEmpty;
  print("Mi lista está vacía? $estaVacia");
  // Oye cuatos elementos tiene tu lista 
  int numeroDeElementos = listaDeCompras.length;
  print("Mi lista tiene $numeroDeElementos cosas");
  // Oye dame el segundo elemento de la lista
  String segundoElemento = listaDeCompras[1];
  print("Mi segundo elemento es: $segundoElemento");
  
  // | 0(Pan) | 1(Vino) | 2(Leche) | 3(Azucar) | 4(Yogurt) | 5(Sal) |
  const listaGrande = ["Pan", "Vino", "Leche", "Azucar", "Yogurt", "Sal"];
  print("El producto es: ${listaGrande[3]}");
 
  
}
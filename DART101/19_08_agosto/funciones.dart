void main() {
  final zapatilla1 = crearZapatilla(id: 1, color: "azul");
  final zapatilla2 = crearZapatilla(id: 2, color: "verde");
  final zapatilla3 = crearZapatilla(id: 3, color: "amarillo");

  final celular1 = crearCelular(
    id: 1,
    peso: 600,
    dimensiones: {'x': 519.78, 'y': 790.45},
    isAndroid: false,
    modelo: "IPhone 16 PLus",
  );
  final celular2 = crearCelular(
    id: 1,
    color: "Blanco",
    memoria: "128 GB",
    peso: 300,
    dimensiones: {'x': 419.78, 'y': 690.45},
    isAndroid: true,
    modelo: "INFINIX ZERO 40",
  );
  final celular3 = crearCelular(
    id: 1,
    color: "ROJO",
    memoria: "256 GB",
    peso: 900,
    dimensiones: {'x': 819.78, 'y': 1090.45},
    isAndroid: false,
    modelo: "IPAD INCH M4 PRO",
  );

  // print('Zapatillas: $zapatilla1 \n $zapatilla2,\n $zapatilla3');
  print('Celulares: $celular1 \n $celular2,\n $celular3');
}

String crearZapatilla({
  required int id,
  color = "blanco",
  String talla = 'L',
  bool hasCordones = false,
}) {
  print('Inicia creación');

  print('Fin creación');
  return "Zapatilla $id creada Color $color Talla $talla ${hasCordones ? "tiene" : "no tiene"} cordones y lista para distribuir";
}

String crearCelular({
  required int id,
  String color = 'negro',
  String memoria = '64 GB',
  required double peso,
  required Map<String, double> dimensiones,
  required bool isAndroid,
  required String modelo,
}) {
  return "Teléfono $id Color $color tiene $memoria de memoria con un peso de $peso gr, dimensiones de ${dimensiones['x']} x ${dimensiones['y']}, ${isAndroid ? "Android" : "iOS"} modelo $modelo";
}

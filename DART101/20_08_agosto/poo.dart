void main() {
  //Creacion de 3 pasteles chocolate, fresa, vainilla
  // final pastelChocolate = Pastel(sabor: "Chocolate", tamano: "L");
  final pastelChocolate = Pastel.defecto();
  final cakeFresa = pastelChocolate.copyWith(sabor: "Fresa");

  print("Chocolate ${pastelChocolate.sabor} ${pastelChocolate.tamano}");
  print("Fresa ${cakeFresa.sabor} ${cakeFresa.tamano}");

  final cakeVainilla = pastelChocolate.copyWith(
    sabor: "Vainilla",
    tamano: "Grande",
  );

  final cakeCyV = pastelChocolate.copyWith(
    sabor: "Chocolate & Vainilla",
    tamano: "Inmenso",
  );

  print('Cholate y vainilla: ${cakeCyV.sabor} ${cakeCyV.tamano}');
  print('CakeVainilla ${cakeVainilla.sabor} ${cakeCyV.tamano}');

  pastelChocolate.hornear();
  cakeVainilla.hornear();
  cakeCyV.hornear();
  cakeFresa.hornear();
}

class Pastel {
  //1. Atributos
  final String sabor;
  final String tamano;
  //variables que funcionen como setters
  double _gramosHarina = 25.5;

  //2. Constructores
  Pastel({required this.sabor, required this.tamano});

  Pastel.defecto({this.sabor = "Chocolate", this.tamano = "Pequeño"});

  //3. Métodos
  Pastel copyWith({String? sabor, String? tamano}) {
    return Pastel(sabor: sabor ?? this.sabor, tamano: tamano ?? this.tamano);
  }

  void hornear() {
    print(
      'El ${this.sabor} se esta horneando.......\nSe está usando $_gramosHarina',
    );
  }

  //4. Getters y Setters

  String get mensajeEntrega =>
      "El pastel es de tamaño ${this.tamano} y de sabor ${this.sabor}";

  set actualizarGramos(double value) {
    this._gramosHarina = value;
  }
}

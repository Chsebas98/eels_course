import 'poo.dart';

void main() {
  final pastelNormalFresa = PastelNormal(sabor: "Fresa", tamano: "Big");
  pastelNormalFresa.hornear();

  final newEsponjoso = PastelEsponjoso(
    // extraTime: 20,
    sabor: 'Berry',
    tamano: 'Mid',
  );
  newEsponjoso.actualizarGramos = 16.6;
  newEsponjoso.batirExtra();
  newEsponjoso.hornear();

  final newCold = PastelFrio(grades: -40, sabor: 'Lima', tamano: 'Mid');
  newCold.enfriar();
}

//Pastel -> Superclase
//Pastel Normal -> Normal
//Pastel Esponjoso -> Esponjoso
//Pastel Frio -> Frio, temperatura y accion enfriar

class PastelNormal extends Pastel {
  PastelNormal({required super.sabor, required super.tamano});
}

class PastelEsponjoso extends Pastel {
  final int extraTime;
  PastelEsponjoso({
    this.extraTime = 10,
    required super.sabor,
    required super.tamano,
  });

  void batirExtra() {
    print(
      extraTime != 10
          ? "Batido por ${this.extraTime} minutos"
          : "Batido por 10 minutos",
    );
  }
}

class PastelFrio extends Pastel {
  final double grades;
  PastelFrio({
    required this.grades,
    required super.sabor,
    required super.tamano,
  });

  void enfriar() {
    if (grades > 0) {
      print('La idea es enfriar intenta con temperaturas bajo 0');
      return;
    }
    print("El pastel se esta enfriando a ${this.grades} °C ");
  }
}

enum Roles { ROL_SUPERUSER, ROL_ADMIN, ROL_USER, ROL_VENTAS }

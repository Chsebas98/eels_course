void main() {
  final name = "Sebas";

  Map<String, dynamic> data = {
    "nombre": name,
    "apellido": "Soberon",
    "edad": 26,
    "peso": 150.1,
    "type:": "lb",
    "altura": 1.75,
    "rol": {
      "tipo": "ADMIN",
      "permisos": ["HOME", "SUMMARY"],
    },
  };

  final usersData = [data, data, data];

  for (var el in usersData) {
    for (var entry in el.entries) {
      print('Mi ${entry.key}: ${entry.value}');
    }
    print('-------------------');
  }
}

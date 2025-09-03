class DataInterface {
  final String image;
  final String title;
  final String description;
  final double price;

  const DataInterface({
    required this.image,
    required this.description,
    required this.title,
    required this.price,
  });
}

class ValidationFieldResult {
  final bool isValid;
  final String? message;

  const ValidationFieldResult({required this.isValid, this.message});
}

import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  const CustomCards({
    super.key,
    required this.title,
    required this.image,
    required this.action,
    this.isNetworkImage = false,
  });

  final String title;
  final String image;
  final VoidCallback action;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 32, // tamaño (64px de diámetro)
        backgroundImage: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        backgroundColor: Colors.grey[200],
      ),
      minTileHeight: 70,
      title: Text(title, textAlign: TextAlign.left),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      titleAlignment: ListTileTitleAlignment.center,
      trailing: IconButton(
        onPressed: action,
        icon: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}

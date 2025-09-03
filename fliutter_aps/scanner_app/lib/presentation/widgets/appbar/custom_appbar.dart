import 'package:flutter/material.dart';
import 'package:scanner_app/core/models/models.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.route,
    this.hasTheme = false,
    this.arguments,
  });

  final String title;
  final String route;
  final bool hasTheme;
  final DataInterface? arguments;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () =>
            Navigator.pushNamed(context, route, arguments: arguments),
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 22),
      ),
      actions: [
        if (hasTheme) IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

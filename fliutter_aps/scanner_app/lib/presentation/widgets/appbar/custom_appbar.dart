import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.route,
    this.hasTheme = false,
  });

  final String title;
  final String route;
  final bool hasTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () => Navigator.pushNamed(context, route),
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

import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text('Flutter Layout Demo'),
      ),
      body: _HomeControllerScreen(),
    );
  }
}

class _HomeControllerScreen extends StatelessWidget {
  const _HomeControllerScreen();

  @override
  Widget build(BuildContext context) {
    return _HomeStructureScreen();
  }
}

class _HomeStructureScreen extends StatelessWidget {
  const _HomeStructureScreen();

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height - kToolbarHeight;
    return SizedBox(
      width: double.infinity,
      height: sizeH,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          FadeInImage(
            placeholder: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/b/b1/Loading_icon.gif',
            ),
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://www.xtrafondos.com/wallpapers/paisaje-digital-en-atardecer-5846.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Oesasdjhas Lake Campground',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black12, endIndent: 20),
                      Row(
                        children: [
                          Text(
                            'Kandersteg, Switzerland',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.deepOrange),
                Text("41"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _actionIcons(icon: Icons.call, desc: 'CALL'),
                _actionIcons(icon: Icons.near_me, desc: 'ROUTE'),
                _actionIcons(icon: Icons.share, desc: 'SHARE'),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Transform.rotate(
                //       angle: 45 * (pi / 180.0),
                //       child: Icon(
                //         Icons.navigation_rounded,
                //         color: Colors.indigo,≈
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Text('CALL', style: TextStyle(color: Colors.indigo)),
                //   ],
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionIcons({
    required IconData icon,
    required String desc,
    Color color = Colors.indigo,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        SizedBox(height: 10),
        Text(desc, style: TextStyle(color: color)),
      ],
    );
  }
}

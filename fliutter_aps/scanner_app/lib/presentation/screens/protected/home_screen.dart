import 'package:flutter/material.dart';
import 'package:scanner_app/core/utils/utils.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _FloatingActionButton(),
      body: _HomeController(),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        iconSize: 32,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(25)),
        ),
      ),
      onPressed: () {},
      icon: Icon(Icons.qr_code_scanner_rounded),
    );
  }
}

class _HomeController extends StatelessWidget {
  const _HomeController();

  @override
  Widget build(BuildContext context) {
    return _HomeStructure();
  }
}

class _HomeStructure extends StatelessWidget {
  const _HomeStructure();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(35),
          ),
          child: FadeInImage(
            placeholder: AssetImage('assets/png/gifLoading.gif'),
            image: NetworkImage(
              'https://onzamarketing.com/wp-content/uploads/2018/02/Que-es-el-marketing-de-servicios.webp',
            ),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Servicios',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    icon: Icon(Icons.exit_to_app_sharp),
                  ),
                ],
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: dataServices.length,
                  itemBuilder: (context, index) {
                    final isNetworkImage = dataServices[index].image.contains(
                      'http',
                    );
                    return CustomCards(
                      isNetworkImage: isNetworkImage,
                      title: dataServices[index].title,
                      image: dataServices[index].image,
                      action: () => Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: dataServices[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scanner_app/presentation/widgets/appbar/custom_appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Detalles del Servicio',
        route: '/home',
        hasTheme: true,
      ),
      body: Text('DetailsScreen'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class RecuperaPasswordScreen extends StatelessWidget {
  const RecuperaPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: 'Recupera Contraseña', route: '/login'),
      body: Center(child: Text('AQUI VA LA RECUPERACION DE CONTRASEÑA')),
    );
  }
}

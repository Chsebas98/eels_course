import 'package:flutter/material.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: '', route: '/login'),
      body: _RegisterController(),
    );
  }
}

class _RegisterController extends StatelessWidget {
  const _RegisterController();

  @override
  Widget build(BuildContext context) {
    return _RegisterStructure();
  }
}

class _RegisterStructure extends StatelessWidget {
  const _RegisterStructure();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            'Completa tus datos para registrarse',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          CustomInput(placeHolder: 'Ingrese un email', label: 'E-mail'),
          SizedBox(height: 16),
          CustomInput(
            placeHolder: 'Ingrese su número de teléfono',
            label: 'Teléfono',
          ),
          SizedBox(height: 16),
          CustomInput(
            placeHolder: 'Ingrese su contraseña',
            label: 'Contraseña',
          ),
          SizedBox(height: 16),
          CustomInput(
            placeHolder: 'Ingrese nuevamente su contraseña',
            label: 'Confirmar Contraseña',
          ),
          SizedBox(height: 24),
          CustomButtonDefault(
            description: 'Registrarse',
            widthButton: double.infinity,
            heightButton: 40,
            hasIcon: false,
            isDisabled: false,
            action: () => Navigator.pushNamed(context, '/login'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _LoginControllerScreen(),
    );
  }
}

class _LoginControllerScreen extends StatefulWidget {
  const _LoginControllerScreen();

  @override
  State<_LoginControllerScreen> createState() => _LoginControllerScreenState();
}

class _LoginControllerScreenState extends State<_LoginControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return _LoginStructureScreen();
  }
}

class _LoginStructureScreen extends StatelessWidget {
  const _LoginStructureScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/png/iconLogo.png',
              height: 41,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 120),
            CustomInput(
              placeHolder: 'Ingrese un email',
              label: 'E-mail',
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              onSubmitted: (value) {
                print('Submit $value');
              },
              validator: (value) {
                return 'Error';
              },
            ),
            SizedBox(height: 16),
            CustomInput(
              placeHolder: 'Ingrese su contraseña',
              label: 'Contraseña',
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              onSubmitted: (newValue) {
                if (kDebugMode) {
                  print('Saved $newValue');
                }
              },
              validator: (value) {
                return 'Error';
              },
            ),
            SizedBox(height: 24),
            CustomButtonDefault(
              description: 'Ingresar',
              widthButton: double.infinity,
              heightButton: 40,
              hasIcon: false,
              isDisabled: false,
              action: () => Navigator.pushNamed(context, '/home'),
            ),
            SizedBox(height: 18),
            TextButton(
              onPressed: () {},
              child: Text(
                'He olvidado mi contraseña',
                style: TextStyle(fontSize: 18, color: Colors.purple),
              ),
            ),
            const Spacer(),
            CustomButtonDefault(
              description: 'Registrarse',
              colorText: Colors.deepPurple,
              colorButton: Colors.white,
              widthButton: double.infinity,
              heightButton: 40,
              hasIcon: false,
              isDisabled: false,
              action: () => Navigator.pushNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}

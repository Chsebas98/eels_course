import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/core/utils/utils.dart';
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

class _LoginStructureScreen extends StatefulWidget {
  const _LoginStructureScreen();

  @override
  State<_LoginStructureScreen> createState() => _LoginStructureScreenState();
}

class _LoginStructureScreenState extends State<_LoginStructureScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  String mail = '';
  String psw = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _loginFormKey,
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
                  setState(() {
                    mail = value;
                  });
                },
                onSubmitted: (value) {
                  if (kDebugMode) {
                    print('Submit $value');
                  }
                },
                validator: (value) {
                  final validator = Formvalidators.isValidMail(mail);
                  return validator.isValid ? null : validator.message;
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
                  setState(() {
                    psw = value;
                  });
                },
                onSubmitted: (newValue) {
                  if (kDebugMode) {
                    print('Saved $newValue');
                  }
                },
                validator: (value) {
                  final validator = Formvalidators.isValidPassword(psw);
                  return validator.isValid ? null : validator.message;
                },
              ),
              SizedBox(height: 24),
              CustomButtonDefault(
                description: 'Ingresar',
                widthButton: double.infinity,
                heightButton: 40,
                hasIcon: false,
                isDisabled: false,
                action: () {
                  if (_loginFormKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
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
      ),
    );
  }
}

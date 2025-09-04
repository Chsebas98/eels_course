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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ThernaryButton(
            description: 'Registrarse',
            widthButton: double.infinity,
            heightButton: 40,
            isDisabled: false,
            action: () => Navigator.pushNamed(context, '/register'),
          ),
        ),
      ),
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
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: _loginFormKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
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
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  validator: (value) {
                    final validator = Formvalidators.isValidPassword(psw);
                    return validator.isValid ? null : validator.message;
                  },
                ),
                SizedBox(height: 24),
                PrimaryButton(
                  description: 'Ingresar',
                  widthButton: double.infinity,
                  heightButton: 40,
                  isDisabled: false,
                  action: () {
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                ),
                SizedBox(height: 18),
                SecondaryButton(
                  description: 'He olvidado mi contraseña',
                  widthButton: double.infinity,
                  heightButton: 40,
                  isDisabled: false,
                  action: () => Navigator.pushNamed(context, '/recupera-psw'),
                ),

                // const Spacer(),
                // ThernaryButton(
                //   description: 'Registrarse',
                //   widthButton: double.infinity,
                //   heightButton: 40,
                //   isDisabled: false,
                //   action: () => Navigator.pushNamed(context, '/register'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

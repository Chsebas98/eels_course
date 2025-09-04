import 'package:flutter/material.dart';
import 'package:scanner_app/core/utils/utils.dart';
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

class _RegisterStructure extends StatefulWidget {
  const _RegisterStructure();

  @override
  State<_RegisterStructure> createState() => _RegisterStructureState();
}

class _RegisterStructureState extends State<_RegisterStructure> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String mail = '';
  String celu = '';
  String psw = '';
  String confirmPsw = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Container(
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
            CustomInput(
              placeHolder: 'Ingrese un email',
              label: 'E-mail',
              onChanged: (value) => setState(() {
                mail = value;
              }),
              validator: (value) {
                final validator = Formvalidators.isValidMail(mail);
                return validator.isValid ? null : validator.message;
              },
            ),
            SizedBox(height: 16),
            CustomInput(
              placeHolder: 'Ingrese su número de teléfono',
              label: 'Teléfono',
              keyBoardType: TextInputType.number,
              onChanged: (value) => setState(() {
                celu = value;
              }),
              validator: (value) {
                final celValidate = Formvalidators.isValidCelu(celu);
                return celValidate.isValid ? null : celValidate.message;
              },
            ),
            SizedBox(height: 16),
            CustomInput(
              placeHolder: 'Ingrese su contraseña',
              label: 'Contraseña',
              onChanged: (value) => setState(() {
                psw = value;
              }),
              validator: (value) {
                final pswValidator = Formvalidators.isValidPassword(psw);
                return pswValidator.isValid ? null : pswValidator.message;
              },
            ),
            SizedBox(height: 16),
            CustomInput(
              placeHolder: 'Ingrese nuevamente su contraseña',
              label: 'Confirmar Contraseña',
              onChanged: (value) => setState(() {
                confirmPsw = value;
              }),
              validator: (value) {
                final cPswValidator = Formvalidators.isValidPassword(
                  confirmPsw,
                );
                final validado = (confirmPsw == psw);
                return cPswValidator.isValid
                    ? null
                    : validado
                    ? null
                    : 'Las contraseñas no coinciden';
              },
            ),
            SizedBox(height: 24),
            PrimaryButton(
              description: 'Registrarse',
              widthButton: double.infinity,
              heightButton: 40,
              isDisabled: false,
              action: () {
                if (_registerFormKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/login');
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

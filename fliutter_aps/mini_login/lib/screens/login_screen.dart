import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_login/application/login-bloc/login_bloc.dart';

GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _LoginControllerScreen(),
    );
  }
}

class _LoginControllerScreen extends StatelessWidget {
  const _LoginControllerScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Sign in to continue', style: TextStyle(fontSize: 16)),
                SizedBox(height: 30),
                _customTextFormField(
                  name: 'Username',
                  onChanged: (value) => context.read<LoginBloc>().add(
                    UsernameChangedEvent(username: value),
                  ),
                  validator: (value) {
                    final result = state.isValidUsername;
                    return result.isValid ? null : result.message;
                  },
                ),
                SizedBox(height: 20),
                _customTextFormField(
                  name: 'Password',
                  isPsw: true,
                  isPswVisible: state.isPswVisible,
                  inputAction: TextInputAction.done,
                  onPressIcon: () =>
                      context.read<LoginBloc>().add(ChangeVisibility()),
                  onChanged: (value) => context.read<LoginBloc>().add(
                    PasswordChangedEvent(password: value),
                  ),
                  validator: (value) {
                    final result = state.isValidPassword;
                    return result.isValid ? null : result.message;
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(
                          SubmittedLoginEvent(username: state.username),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Dont't have an account? Sign Up",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _customTextFormField({
    required String name,
    required FormFieldValidator<String>? validator,
    required ValueChanged<String>? onChanged,
    VoidCallback? onPressIcon,
    TextInputAction inputAction = TextInputAction.next,
    bool isPsw = false,
    bool isPswVisible = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        hintStyle: TextStyle(fontSize: 15),
        labelText: name,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(fontSize: 12, color: Colors.redAccent),
        counterText: '',
        suffixIcon: !isPsw
            ? null
            : GestureDetector(
                onTap: onPressIcon,
                child: Icon(
                  isPswVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
      ),
      obscureText: isPswVisible ? true : false,
      validator: validator,
      onChanged: onChanged,
      textInputAction: inputAction,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:san_chat/presentation/theme/styles.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    required this.onChanged,
    required this.validator,
    this.isPsw = false,
    this.textInputAction = TextInputAction.next,
  });
  final String label;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final bool isPsw;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyDivider),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.green,
          fontWeight: FontWeight.w500,
        ),
      ),
      cursorColor: AppColors.grey,
      obscureText: isPsw,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction,
    );
  }
}

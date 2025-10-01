import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san_chat/app/core/ui/ui.dart';

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
      decoration: InputDecoration(counterText: '', labelText: label),
      style: TextStyle(fontSize: 14.sp),
      cursorColor: AppColors.grey,
      obscureText: isPsw,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction,
    );
  }
}

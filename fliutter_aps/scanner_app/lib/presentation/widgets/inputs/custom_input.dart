import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.placeHolder,
    required this.label,
    this.keyBoardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.cursorColor = Colors.indigoAccent,
    this.maxLines = 1,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onSubmitted,
  });

  final String placeHolder;
  final String label;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  final bool autofocus;
  final Color cursorColor;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      cursorColor: cursorColor,
      textInputAction: textInputAction,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hint: Text(placeHolder),
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        floatingLabelAlignment: FloatingLabelAlignment.start,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        label: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

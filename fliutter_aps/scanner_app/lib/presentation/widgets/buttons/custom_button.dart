import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  const CustomButtonDefault({
    super.key,
    this.action,
    required this.description,
    this.colorButton = Colors.purple,
    required this.widthButton,
    required this.heightButton,
    required this.hasIcon,
    required this.isDisabled,
    this.icon,
    this.colorText = Colors.white,
    this.colorBorder = Colors.deepPurple,
  });

  final VoidCallback? action;
  final String description;
  final Color colorText;
  final Color colorButton;
  final Color colorBorder;
  final double widthButton;
  final double heightButton;
  final bool isDisabled;
  final bool hasIcon;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      height: heightButton,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDisabled ? Colors.black45 : colorButton,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: colorBorder),
            ),
          ),
        ),
        onPressed: isDisabled ? null : action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasIcon) icon!,
            Text(
              description,
              style: TextStyle(
                color: isDisabled ? Colors.black54 : colorText,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

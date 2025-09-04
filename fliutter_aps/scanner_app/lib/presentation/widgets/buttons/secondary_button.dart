import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.action,
    required this.description,
    required this.widthButton,
    required this.heightButton,
    required this.isDisabled,
    this.icon,
  });

  final VoidCallback? action;
  final String description;
  // final Color colorText;
  // final Color colorButton;
  // final Color colorBorder;
  final double widthButton;
  final double heightButton;
  final bool isDisabled;
  // final bool hasIcon;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      height: heightButton,

      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(
            isDisabled ? Colors.black45 : Colors.white,
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),
        onPressed: isDisabled ? null : action,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // if (hasIcon) icon!,
            Text(
              description,
              style: TextStyle(
                color: isDisabled ? Colors.black54 : Colors.deepPurple,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

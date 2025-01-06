import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    required this.buttonPadding,
    required this.onTapFunction,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
    required this.buttonText,
  });

  final EdgeInsets buttonPadding;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final Function() onTapFunction;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttonPadding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor,
          foregroundColor: buttonTextColor,
        ),
        onPressed: onTapFunction,
        child: Text(buttonText),
      ),
    );
  }
}

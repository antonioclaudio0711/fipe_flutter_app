import 'package:flutter/material.dart';

class VehicleTypeCard extends StatelessWidget {
  const VehicleTypeCard({
    super.key,
    required this.onTapFunction,
    required this.cardName,
    this.buttonBackgroundColor,
    this.buttonTextColor,
  });

  final Function() onTapFunction;
  final String cardName;
  final Color? buttonBackgroundColor;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            cardName,
            style: TextStyle(color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomizeInformativeContainer extends StatelessWidget {
  const CustomizeInformativeContainer({
    super.key,
    required this.informativeContainerText,
    required this.informativeContainerBackgroundColor,
    required this.informativeContainerTextColor,
  });

  final String informativeContainerText;
  final Color informativeContainerBackgroundColor;
  final Color informativeContainerTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: informativeContainerBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        informativeContainerText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: informativeContainerTextColor,
          fontSize: 15,
        ),
      ),
    );
  }
}

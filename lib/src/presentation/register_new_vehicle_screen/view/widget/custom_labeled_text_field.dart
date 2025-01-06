import 'package:flutter/material.dart';

class CustomLabeledTextField extends StatelessWidget {
  const CustomLabeledTextField({
    super.key,
    required this.informativeText,
    required this.textController,
    required this.hintText,
  });

  final String informativeText;
  final TextEditingController textController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(informativeText),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: TextField(
              controller: textController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

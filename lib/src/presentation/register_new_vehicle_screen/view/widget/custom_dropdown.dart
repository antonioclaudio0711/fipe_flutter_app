import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.dropDownItems,
    this.selectedValue,
    required this.onChangedFunction,
    required this.dropdownWidth,
  });

  final List<DropdownMenuItem<String>>? dropDownItems;
  final String? selectedValue;
  final double dropdownWidth;
  final Function(String?) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        items: dropDownItems,
        value: selectedValue,
        onChanged: onChangedFunction,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.all(8),
          width: dropdownWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: MediaQuery.of(context).size.height / 4,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}

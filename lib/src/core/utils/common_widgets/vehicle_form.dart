import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_brand_selection_section.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_model_selection_section.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_type_selection_section.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_year_selection_section.dart';
import 'package:flutter/material.dart';

class VehicleForm<T> extends StatelessWidget {
  const VehicleForm({
    super.key,
    required this.controller,
  });

  final T controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VehicleTypeSelectionSection(controller: controller),
        VehicleBrandSelectionSection(controller: controller),
        VehicleModelSelectionSection(controller: controller),
        VehicleYearSelectionSection(controller: controller),
      ],
    );
  }
}

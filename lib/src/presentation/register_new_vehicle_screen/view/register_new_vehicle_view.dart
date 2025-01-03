import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/controller/register_new_vehicle_controller.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_brand_selection_section.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_model_selection_section.dart';
import 'package:fipe_app/src/presentation/register_new_vehicle_screen/view/widget/form_sections/vehicle_type_selection_section.dart';
import 'package:flutter/material.dart';

class RegisterNewVehicleView extends StatefulWidget {
  const RegisterNewVehicleView({super.key});

  static const routeName = AppRoutes.registerNewVehicleRoute;

  @override
  State<RegisterNewVehicleView> createState() => _RegisterNewVehicleViewState();
}

class _RegisterNewVehicleViewState extends State<RegisterNewVehicleView> {
  final _formKey = GlobalKey<FormState>();
  final RegisterNewVehicleController _controller =
      RegisterNewVehicleController();

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      scaffoldBody: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              VehicleTypeSelectionSection(controller: _controller),
              const SizedBox(height: 30),
              VehicleBrandSelectionSection(controller: _controller),
              const SizedBox(height: 30),
              VehicleModelSelectionSection(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

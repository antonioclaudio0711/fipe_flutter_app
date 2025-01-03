import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:flutter/material.dart';

class RegisterNewVehicleView extends StatelessWidget {
  const RegisterNewVehicleView({super.key});

  static const routeName = AppRoutes.registerNewVehicleRoute;

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
        scaffoldBody: Center(
      child: Text('data'),
    ));
  }
}

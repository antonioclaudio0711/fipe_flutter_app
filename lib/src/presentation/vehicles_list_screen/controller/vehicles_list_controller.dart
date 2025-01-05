import 'dart:convert';

import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehiclesListController extends ChangeNotifier {
  VehiclesListController();

  final _navigationService = GetIt.I<NavigationService>();

  ValueNotifier<List<LocalVehicleModel>> localVehiclesList = ValueNotifier([]);

  Future<void> getInitialLocalVehiclesList() async {
    await Future.delayed(const Duration(seconds: 1));

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String>? jsonList =
        preferences.getStringList('localVehiclesList');

    if (jsonList == null) {
      await preferences.setStringList('localVehiclesList', []);
    } else if (jsonList.isEmpty) {
      return;
    } else {
      localVehiclesList.value = jsonList.map((localVehicleModelStr) {
        return LocalVehicleModel.fromJson(
          jsonDecode(localVehicleModelStr),
        );
      }).toList();
    }
  }

  void navigateToRegisterNewVehicleView(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name !=
        AppRoutes.registerNewVehicleRoute) {
      _navigationService
          .pushNamedAndRemoveUntil(AppRoutes.registerNewVehicleRoute);
    } else {
      _navigationService.goBack();
    }
  }
}

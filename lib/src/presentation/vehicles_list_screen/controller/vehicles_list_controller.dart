import 'dart:convert';

import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehiclesListController extends ChangeNotifier {
  VehiclesListController();

  final NavigationService navigationService = GetIt.I<NavigationService>();

  ValueNotifier<List<LocalVehicleModel>> localVehiclesList = ValueNotifier([]);
  ValueNotifier<List<LocalVehicleModel>> filteredVehiclesList =
      ValueNotifier([]);

  ValueNotifier<String?> selectedFilterType = ValueNotifier(null);
  ValueNotifier<List<String>> listFromFilterType = ValueNotifier([]);
  ValueNotifier<String?> selectedFilterElement = ValueNotifier(null);

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

      filteredVehiclesList.value = localVehiclesList.value;
    }
  }

  void navigateToRegisterNewVehicleView(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name !=
        AppRoutes.registerNewVehicleRoute) {
      navigationService
          .pushNamedAndRemoveUntil(AppRoutes.registerNewVehicleRoute);
    } else {
      navigationService.goBack();
    }
  }

  Future<void> cleanRegisteredVehiclesList() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('localVehiclesList', []);

    localVehiclesList.value = [];
    filteredVehiclesList.value = [];
  }

  void resetAllFilterValues() {
    listFromFilterType.value = [];
    selectedFilterType.value = null;
    selectedFilterElement.value = null;
  }

  void turnToOriginalList() {
    filteredVehiclesList.value = localVehiclesList.value;
  }

  void selectFilterType({required String filterType}) {
    selectedFilterElement.value = null;

    selectedFilterType.value = filterType;

    switch (filterType) {
      case 'Marca':
        List<String> localVehiclesBrandsList = [];
        localVehiclesList.value.map((localVehicle) {
          if (localVehiclesBrandsList.contains(localVehicle.brand)) {
            return;
          } else {
            localVehiclesBrandsList.add(localVehicle.brand);
          }
        }).toList();

        listFromFilterType.value = localVehiclesBrandsList;

      case 'Ano':
        List<String> localVehiclesYearsList = [];
        localVehiclesList.value.map((localVehicle) {
          if (localVehiclesYearsList.contains(
            localVehicle.modelYear.toString(),
          )) {
            return;
          } else {
            localVehiclesYearsList.add(localVehicle.modelYear.toString());
          }
        }).toList();

        listFromFilterType.value = localVehiclesYearsList;
    }
  }

  void selectFilterElement({required String filterElement}) {
    selectedFilterElement.value = filterElement;

    listFromFilterType.notifyListeners();
  }

  void filterLocalVehiclesList() {
    switch (selectedFilterType.value) {
      case 'Marca':
        filteredVehiclesList.value = localVehiclesList.value
            .where(
              (localVehicle) =>
                  localVehicle.brand == selectedFilterElement.value,
            )
            .toList();
      case 'Ano':
        filteredVehiclesList.value = localVehiclesList.value
            .where(
              (localVehicle) =>
                  localVehicle.modelYear.toString() ==
                  selectedFilterElement.value,
            )
            .toList();
    }
  }
}

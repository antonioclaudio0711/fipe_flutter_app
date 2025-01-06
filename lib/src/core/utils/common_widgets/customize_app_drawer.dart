import 'package:fipe_app/src/core/utils/app_assets.dart';
import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/service/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomizeAppDrawer extends StatelessWidget {
  const CustomizeAppDrawer({super.key});

  void navigateTo(
    BuildContext context, {
    required String destinationRoute,
  }) {
    final navigationService = GetIt.I<NavigationService>();

    if (ModalRoute.of(context)?.settings.name != destinationRoute) {
      navigationService.pushNamedAndRemoveUntil(destinationRoute);
    } else {
      navigationService.goBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Image.asset(
              AppAssets.vectorCarAsset,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text(AppStrings.registeredVehiclesString),
            onTap: () => navigateTo(
              context,
              destinationRoute: AppRoutes.initialAppRoute,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(AppStrings.registerNewVehicleString),
            onTap: () => navigateTo(
              context,
              destinationRoute: AppRoutes.registerNewVehicleRoute,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.manage_search),
            title: const Text(AppStrings.singleConsultationString),
            onTap: () => navigateTo(
              context,
              destinationRoute: AppRoutes.singleConsultationRoute,
            ),
          ),
        ],
      ),
    );
  }
}

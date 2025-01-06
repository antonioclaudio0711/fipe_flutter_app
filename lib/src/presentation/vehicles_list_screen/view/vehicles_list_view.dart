import 'package:fipe_app/src/core/utils/app_strings.dart';
import 'package:fipe_app/src/core/utils/app_routes.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_app_scaffold.dart';
import 'package:fipe_app/src/core/utils/common_widgets/customize_button.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/controller/vehicles_list_controller.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/view/widgets/clean_list_alert_dialog.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/view/widgets/filter_alert_dialog.dart';
import 'package:fipe_app/src/presentation/vehicles_list_screen/view/widgets/vehicle_list_card.dart';
import 'package:flutter/material.dart';

class VehiclesListView extends StatefulWidget {
  const VehiclesListView({super.key});

  static const routeName = AppRoutes.initialAppRoute;

  @override
  State<VehiclesListView> createState() => _VehiclesListViewState();
}

class _VehiclesListViewState extends State<VehiclesListView> {
  final VehiclesListController _controller = VehiclesListController();

  @override
  Widget build(BuildContext context) {
    return CustomizeAppScaffold(
      canPop: false,
      appBarActionsWidgetsList: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => CleanListAlertDialog(
                controller: _controller,
              ),
            );
          },
          icon: const Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => FilterAlertDialog(
                controller: _controller,
              ),
            );
          },
          icon: const Icon(Icons.filter_alt),
        )
      ],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => _controller.navigateToRegisterNewVehicleView(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      scaffoldBody: FutureBuilder(
        future: _controller.getInitialLocalVehiclesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else {
            return ValueListenableBuilder(
              valueListenable: _controller.filteredVehiclesList,
              builder: (context, filteredVehiclesList, _) {
                if (filteredVehiclesList.isEmpty) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        AppStrings.registeredVehiclesUnfoundString,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredVehiclesList.length,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _controller.navigationService.navigateTo(
                                AppRoutes.vehicleDetailsRoute,
                                arguments: filteredVehiclesList[index],
                              );
                            },
                            child: VehicleListCard(
                              localVehicleModel: filteredVehiclesList[index],
                            ),
                          );
                        },
                      ),
                      ValueListenableBuilder(
                        valueListenable: _controller.filteredVehiclesList,
                        builder: (context, filteredVehiclesList, _) {
                          if (_controller.localVehiclesList.value !=
                              _controller.filteredVehiclesList.value) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomizeButton(
                                buttonPadding:
                                    const EdgeInsets.only(bottom: 20),
                                onTapFunction: () =>
                                    _controller.turnToOriginalList(),
                                buttonBackgroundColor: Colors.grey,
                                buttonTextColor: Colors.white,
                                buttonText: 'Voltar à listagem original',
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:fipe_app/src/core/utils/utils.dart';
import 'package:fipe_app/src/data/local/local_vehicle/models/local_vehicle_model.dart';
import 'package:flutter/material.dart';

class VehicleListCard extends StatelessWidget {
  const VehicleListCard({
    super.key,
    required this.localVehicleModel,
  });

  final LocalVehicleModel localVehicleModel;

  @override
  Widget build(BuildContext context) {
    final String cardImage = cardImageAccordingVehicleType(
      vehicleType: localVehicleModel.vehicleType,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(cardImage),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localVehicleModel.model,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  localVehicleModel.brand,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }
}

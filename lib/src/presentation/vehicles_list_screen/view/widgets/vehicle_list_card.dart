import 'package:fipe_app/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class VehicleListCard extends StatelessWidget {
  const VehicleListCard({
    super.key,
    required this.vehicleModel,
    required this.vehicleBrand,
  });

  final String vehicleModel;
  final String vehicleBrand;

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(AppAssets.vectorCarAsset),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleModel,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  vehicleBrand,
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

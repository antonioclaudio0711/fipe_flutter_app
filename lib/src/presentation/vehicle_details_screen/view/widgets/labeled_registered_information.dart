import 'package:fipe_app/src/core/utils/common_widgets/customize_informative_container.dart';
import 'package:flutter/material.dart';

class LabeledRegisteredInformation extends StatelessWidget {
  const LabeledRegisteredInformation({
    super.key,
    required this.registeredInformationLabel,
    required this.registeredInformation,
  });

  final String registeredInformationLabel;
  final String registeredInformation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.4 * MediaQuery.of(context).size.width,
            child: CustomizeInformativeContainer(
              informativeContainerText: registeredInformationLabel,
              informativeContainerBackgroundColor: Colors.grey,
              informativeContainerTextColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 0.45 * MediaQuery.of(context).size.width,
            child: Text(
              registeredInformation,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

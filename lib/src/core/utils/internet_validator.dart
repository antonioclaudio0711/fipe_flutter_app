import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetValidator extends ChangeNotifier {
  InternetValidator();

  ValueNotifier<bool?> isConnectedToInternet = ValueNotifier(null);

  StreamSubscription? internetConnectionStreamSubscription;

  void verifyInternetConnection() {
    internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetStatus.connected:
            isConnectedToInternet.value = true;

          case InternetStatus.disconnected:
            isConnectedToInternet.value = false;
            break;

          default:
            isConnectedToInternet.value = false;
            break;
        }
      },
    );
  }
}

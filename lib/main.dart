import 'package:fipe_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:fipe_app/src/core/di/injection_container.dart' as di;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

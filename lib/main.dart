import 'package:fipe_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:fipe_app/src/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

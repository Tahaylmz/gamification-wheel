import 'package:flutter/material.dart';
import 'core/utils/helpers/init/app_initialize.dart';
import 'presentation/pages/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialize.initialize();
  runApp(const MainApp());
}

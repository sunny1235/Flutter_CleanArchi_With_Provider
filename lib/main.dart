import 'package:flutter/material.dart';
import 'package:flutter_ca_demo/features/home/app_foundation.dart';

import 'features/di/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const AppFoundation());
}

import 'package:flutter/material.dart';
import 'package:flutter_ca_demo/home/app_foundation.dart';

import 'di/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const AppFoundation());
}

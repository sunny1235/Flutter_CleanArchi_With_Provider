import 'package:flutter/cupertino.dart';
import 'package:flutter_ca_demo/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter_ca_demo/features/dashboard/screens/dashboard_screen.dart';

import 'route_paths.dart';

class AppRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.root:
        return CupertinoPageRoute(
          builder: (ctx) => const LoginScreen(),
          settings: settings,
          title: AppRoutePaths.root,
        );
      
       case AppRoutePaths.dashboard:
        return CupertinoPageRoute(
          builder: (ctx) => const Dashboard(),
          settings: settings,
          title: AppRoutePaths.dashboard,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const LoginScreen(),
      settings: settings,
      title: AppRoutePaths.root,
    );
  }
}


import 'package:flutter_ca_demo/features/di/di_container.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import '../authentication/presentation/provider/auth_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider<AuthViewModel>(create: (_)=> locator<AuthViewModel>()),
   ];
}

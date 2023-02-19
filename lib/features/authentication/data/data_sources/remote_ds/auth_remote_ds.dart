

import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthRemoteDs {

    
  /// login user
  Future<bool> login({
    required String email,
    required String password,
  });


  /// log out 
  Future<void> logOut();
}

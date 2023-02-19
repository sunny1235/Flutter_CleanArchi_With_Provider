import 'dart:convert';

import 'package:flutter_ca_demo/core/errors/exception.dart';
import 'package:flutter_ca_demo/features/authentication/data/models/auth_model.dart';
import 'package:flutter_ca_demo/features/authentication/domain/entity/auth_entity.dart';

import 'auth_remote_ds.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDsImpl extends AuthRemoteDs {
  /// dummy method for login user
  @override
  Future<bool> login({      
    required String email,
    required String password,
  }) async {
    
    final res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    print("Response length :: ${res.body.length}");

    if (res.body.isNotEmpty) {
      return Future.value(true);
    }else{
      throw CustomException("No Data Found from server");
    }

    // var result = AuthModel.fromJson(jsonDecode(res.body));
    // print("DATA $result ");

    //here you can return response from api call.
    // return Future.value(false);
  }

  /// dummy method for logout
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}

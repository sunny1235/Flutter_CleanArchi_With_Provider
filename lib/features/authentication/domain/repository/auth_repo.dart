import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_ca_demo/core/errors/failure.dart';

@immutable
abstract class AuthRepo {


  /// login user
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  });


  /// log out 
  Future<Either<Failure, void>> logOut();
}

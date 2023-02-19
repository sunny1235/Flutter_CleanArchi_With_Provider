import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ca_demo/core/errors/failure.dart';


import '../../../../base/base_model.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthViewModel extends BaseModel {
  final LoginUsecase loginUsecase;

  AuthViewModel({required this.loginUsecase});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  Future<Either<Failure, bool>> login() async {
    final res = await loginUsecase.call(LoginParams(
        email: emailController.text, password: passwordController.text));

    return res;
  }



}

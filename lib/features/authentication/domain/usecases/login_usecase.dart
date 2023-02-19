import 'package:flutter_ca_demo/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ca_demo/core/usecases/base_usecase.dart';
import 'package:flutter_ca_demo/features/authentication/domain/repository/auth_repo.dart';

class LoginUsecase extends BaseUsecase<bool, LoginParams> {
  final AuthRepo authRepo;

  LoginUsecase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(LoginParams params) {
    return authRepo.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

import 'package:flutter_ca_demo/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ca_demo/core/network/connection.dart';
import 'package:flutter_ca_demo/core/usecases/safe_api_call_usecase.dart';
import 'package:flutter_ca_demo/features/authentication/data/data_sources/remote_ds/auth_remote_ds.dart';
import 'package:flutter_ca_demo/features/authentication/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDs authRemoteDs;
  final SafeApiCallUsecase safeApiCallUsecase;

  AuthRepoImpl({
    required this.safeApiCallUsecase,
    required this.authRemoteDs,
  });

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    return await safeApiCallUsecase
        .call<bool>(() => authRemoteDs.login(email: email, password: password));
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    return await safeApiCallUsecase.call<void>(() => authRemoteDs.logOut());
  }
}

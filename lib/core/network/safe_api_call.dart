import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ca_demo/core/errors/exception.dart';
import 'package:flutter_ca_demo/core/errors/invalid_exception.dart';

import '../errors/failure.dart';
import 'connection.dart';

// ignore: constant_identifier_names
const String NO_INTERNET_CONNECTION = "No internet connection!";

abstract class SafeApiCall {
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler);
}

class SafeApiCallImpl extends SafeApiCall {
  final NetworkInfo networkInfo;
  SafeApiCallImpl({required this.networkInfo});

  @override
  Future<Either<Failure, T>> callApi<T>(Future<T> Function() handler) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await handler();
        return Right(response);
      } on HttpException catch (err) {
        return Left(Failure(err.message));
      } on SocketException catch (err) {
        return Left(Failure(err.message));
      } on FormatException catch (err) {
        return Left(Failure(err.message));
      }   on IOException catch (err) {
        return Left(Failure(err.toString()));
      } on InvalidException catch (err) {
        return Left(Failure(err.toString()));
      } on NetworkImageLoadException catch (err) {
        return Left(Failure(err.toString()));
      } on TimeoutException catch (err) {
        return Left(Failure(err.message.toString()));
      } on CustomException catch (err) {
        return Left(Failure(err.msg.toString()));
      } catch (e){
        return Left(Failure(e.toString()));
      }
    } else {
      return Left(Failure(NO_INTERNET_CONNECTION));
    }
  }
}






import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_ca_demo/features/authentication/data/data_sources/remote_ds/auth_remote_ds.dart';
import 'package:flutter_ca_demo/features/authentication/data/data_sources/remote_ds/auth_remote_ds_impl.dart';
import 'package:flutter_ca_demo/features/authentication/data/reposiotry_impls/auth_repo_impl.dart';
import 'package:flutter_ca_demo/features/authentication/domain/repository/auth_repo.dart';
import 'package:flutter_ca_demo/features/authentication/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';



import '../../core/network/connection.dart';
import '../../core/usecases/safe_api_call_usecase.dart';
import '../../core/network/safe_api_call.dart';
import '../authentication/presentation/provider/auth_view_model.dart';

final GetIt locator = GetIt.instance;
Future<void> initializeDependencies() async {
/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::: VIEWMODELS/PROVIDERS/CONTROLLERS ::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

locator.registerFactory<AuthViewModel>(() => AuthViewModel(
  loginUsecase: locator.call(),
));


/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
     :::::::::::::::: USECASES :::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */
// ================ Safe Api Call ===============================

  locator.registerLazySingleton<SafeApiCallUsecase>(() => SafeApiCallUsecase(
        safeApiCall: locator.call(),
      ));

  locator.registerLazySingleton<LoginUsecase>(() => LoginUsecase(
       authRepo: locator.call(),
      ));


    

/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::LOCAL DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */


/* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::REMOTE DATA SOURCES ::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */
   locator.registerLazySingleton<AuthRemoteDs>(() => AuthRemoteDsImpl()); 


/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  REPOSITORIES ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

   locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
    safeApiCallUsecase: locator(),
    authRemoteDs: locator(),
   )); 


/* 
:::::::::::::::::::::::::::::::
    :::::::: CORE ::::::::::::::::
:::::::::::::::::::::::::::::::
 */

  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(
        connectivity: locator.call(),
      ));
  locator.registerFactory<SafeApiCall>(() => SafeApiCallImpl(
        networkInfo: locator.call(),
      ));

/* 
:::::::::::::::::::::::::::::::::::::::::::::::
    :::::::: EXTERNAL DATA SOURCES - DEPENDENCIES ::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::
 */

  final Connectivity connectivity = Connectivity();

  locator.registerLazySingleton(() => connectivity);
}

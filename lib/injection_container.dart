import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/connectivity/connectivity_cubit.dart';
import 'core/network/dio_client.dart';
import 'core/service/app_storage_manager.dart';
import 'core/utils/network_info.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiClient>(() =>
      ApiClient(dio: sl(), connectivityCubit: sl(), storageManager: sl()));

  sl.registerLazySingleton(() => ConnectivityCubit());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl())); //

  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();

  sl.registerLazySingleton<AppStorageManager>(
    () => AppStorageManager(prefs: prefs, secureStorage: secureStorage),
  );

  // sl
  //   ..registerFactory(() => RegisterBloc(registerUserUseCase: sl()))
  //   ..registerLazySingleton(() => RegisterUserUseCase(sl()))
  //   ..registerLazySingleton<IAuthRepository>(
  //       () => AuthRepositoryImpl(remoteDataSource: sl()))
  //   ..registerLazySingleton<AuthRemoteDataSource>(() =>
  //       AuthRemoteDataSourceImpl(
  //           client: sl(), networkInfo: sl(), storage: sl()));
  //
  // sl
  //   ..registerFactory(() => SignInBloc(signInUserUseCase: sl()))
  //   ..registerLazySingleton(() => SignInUserUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => ResendOtpBloc(resendOtpUseCase: sl()))
  //   ..registerLazySingleton(() => ResendOtpUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() =>
  //       VerifyOtpBloc(verifyOtpUseCase: sl(), verifySignInOtpUseCase: sl()))
  //   ..registerLazySingleton(() => VerifyOtpUseCase(sl()))
  //   ..registerLazySingleton(() => VerifySignInOtpUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => DeleteAccountBloc(deleteAccountUseCase: sl()))
  //   ..registerLazySingleton(() => DeleteAccountUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => LogOutBloc(logOutUseCase: sl()))
  //   ..registerLazySingleton(() => LogOutUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => ProfileBloc(sl()))
  //   ..registerLazySingleton(() => GetProfileUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => UpdateProfileBloc(updateProfileUseCase: sl()))
  //   ..registerLazySingleton(() => UpdateProfileUseCase(sl()));
  //
  // sl
  //   ..registerFactory(() => AddressBloc(sl(), sl(), sl(), sl()))
  //   ..registerLazySingleton(() => GetAddressUseCase(sl()))
  //   ..registerLazySingleton(() => DeleteAddress(sl()))
  //   ..registerLazySingleton(() => AddAddressUsecase(sl()))
  //   ..registerLazySingleton(() => UpdateAddress(sl()))
  //   ..registerLazySingleton<IDeliveryAddressRepository>(
  //       () => DeliveryAddressRepoImpl(remoteDataSource: sl()))
  //   ..registerLazySingleton<DeliveryAddressDatasource>(() =>
  //       DeliveryAddressDatasourceImpl(
  //           client: sl(), networkInfo: sl(), storage: sl()));
  //
  // sl
  //   ..registerFactory(() => ReferralBloc(sl()))
  //   ..registerLazySingleton(() => GetReferralUseCase(sl()))
  //   ..registerLazySingleton<IReferralRepo>(
  //       () => ReferralRepoImpl(remoteDataSource: sl()))
  //   ..registerLazySingleton<ReferralRemoteDatasource>(
  //       () => ReferralRemoteDatasourceImpl(client: sl(), networkInfo: sl()));
  // sl
  //   ..registerFactory(() => FaqBloc(sl()))
  //   ..registerLazySingleton(() => GetFaqUseCase(sl()))
  //   ..registerLazySingleton<IFaqRepo>(() => FaqRepoImpl(remoteDataSource: sl()))
  //   ..registerLazySingleton<FaqRemoteDatasource>(
  //       () => FaqRemoteDatasourceImpl(client: sl(), networkInfo: sl()));
  //
  // sl
  //   ..registerFactory(() => WalletBloc(sl(), sl(), sl()))
  //   ..registerLazySingleton(() => GetWalletUseCase(sl()))
  //   ..registerLazySingleton(() => VerifyPaymentUseCase(sl()))
  //   ..registerLazySingleton(() => InitializePaymentUseCase(sl()))
  //   ..registerLazySingleton<IWalletRepository>(
  //       () => WalletRepositoryImpl(remoteDataSource: sl()))
  //   ..registerLazySingleton<WalletRemoteDatasource>(
  //       () => WalletRemoteDatasourceImpl(client: sl(), networkInfo: sl()));
  //





}

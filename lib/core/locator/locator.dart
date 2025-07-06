import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:instastyle/core/localstorage/local_data.dart';
import 'package:instastyle/core/network/api_provider_imp.dart';
import 'package:instastyle/core/network/dio_wrapper.dart';
import 'package:instastyle/feature/auth/data/data_source/remote/api_provider.dart';
import 'package:instastyle/feature/auth/data/repository/auth_repositoryImpl.dart';
import 'package:instastyle/feature/auth/domain/repository/auth_repository.dart';
import 'package:instastyle/feature/auth/domain/use_cases/login_usecase.dart';
import 'package:instastyle/feature/auth/domain/use_cases/otp_usecase.dart';
import 'package:instastyle/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:instastyle/feature/product/data/data_source/remote/product_api_provider.dart';
import 'package:instastyle/feature/product/data/repository/product_repositoryImp.dart';
import 'package:instastyle/feature/product/domain/repository/product_repository.dart';
import 'package:instastyle/feature/product/domain/use_case/myket_payment_usecase.dart';
import 'package:instastyle/feature/product/domain/use_case/payment_usecase.dart';
import 'package:instastyle/feature/product/domain/use_case/product_usecase.dart';
import 'package:instastyle/feature/product/presentation/bloc/product_bloc.dart';
import 'package:instastyle/feature/status/data/data_source/remote/status_api_provider.dart';
import 'package:instastyle/feature/status/data/repository/status_repositoryImpl.dart';
import 'package:instastyle/feature/status/domain/repository/status_repository.dart';
import 'package:instastyle/feature/status/domain/use_case/status_usecase.dart';
import 'package:instastyle/feature/status/presentation/bloc/status_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

setup() async {
  //dio instances

  final sharedPreferences = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<LocalData>(LocalData());
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<StatusApiProvider>(StatusApiProvider());
  locator.registerSingleton<ProductApiProvider>(ProductApiProvider());

  /// dio
  locator.registerSingleton<Dio>(ViolationDioWrapper.provide());
  locator.registerSingleton<ApiProviderImp>(ApiProviderImp());

  ///repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryimpl(locator()));
  locator.registerSingleton<StatusRepository>(StatusRepositoryimpl(locator()));
  locator.registerSingleton<ProductRepository>(ProductRepositoryimp(locator()));
  // locator.registerSingleton<CropRepository>(CropRepositoryimpl(locator()));
  // locator.registerSingleton<ChatRespository>(ChatRepositoryimpl(locator()));
  // locator.registerSingleton<HistoryRepository>(HistoryRepositoryimpl(locator()));
  // locator.registerSingleton<HomeRepository>(HomeRepositoryimpl(locator()));

  ///use case
  locator.registerSingleton<LoginUsecase>(LoginUsecase(locator()));
  locator.registerSingleton<OtpUsecase>(OtpUsecase(locator()));
  // locator.registerSingleton<SaveUserUsecase>(SaveUserUsecase(locator()));
  locator.registerSingleton<StatusUsecase>(StatusUsecase(locator()));
  locator.registerSingleton<ProductUseCase>(ProductUseCase(locator()));
  locator.registerSingleton<PaymentUsecase>(PaymentUsecase(locator()));
  locator
      .registerSingleton<MyketPaymentUsecase>(MyketPaymentUsecase(locator()));

  // locator.registerFactory<HomeBloc>(() => HomeBloc(locator(), locator()));
  locator.registerFactory<AuthBloc>(() => AuthBloc(locator(), locator()));
  // locator.registerFactory<CheckAuthBloc>(() => CheckAuthBloc());
  locator.registerFactory<StatusBloc>(() => StatusBloc(locator()));
  locator.registerFactory<ProductBloc>(
      () => ProductBloc(locator(), locator(), locator()));
}

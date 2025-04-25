import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:instastyle/core/network/api_provider_imp.dart';
import 'package:instastyle/core/network/dio_wrapper.dart';

GetIt locator = GetIt.instance;

setup() async {
  //dio instances
  locator.registerSingleton<Dio>(ViolationDioWrapper.provide());
  locator.registerSingleton<ApiProviderImp>(ApiProviderImp());
}

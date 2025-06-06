import 'package:dio/dio.dart';
import 'package:instastyle/core/locator/locator.dart';
import 'package:instastyle/core/network/api_provider_imp.dart';
import 'package:instastyle/utils/constant.dart';
import '../../../../../core/localstorage/local_data.dart';

class StatusApiProvider {
  Future<Response> getStatus() async {
    final res = await locator<ApiProviderImp>()
        .get('https://api.texim.ir/api/status', queryParameter: {
      'package_name': Constants.packageName,
    }, headerParameter: {
      'Authorization': 'Bearer ${LocalData.firstTokenNotifier.value}',
    });
    return res;
  }

  Future<Response> getStatusV1() async {
    final res = await locator<ApiProviderImp>().get(
        'https://api.texim.ir/api/paid-status-v1?package_name=${Constants.packageName}',
        headerParameter: {
          'Authorization': 'Bearer ${LocalData.firstTokenNotifier.value}',
        });
    return res;
  }
}

import 'package:dio/dio.dart';

import '../../../../../core/locator/locator.dart';
import '../../../../../core/network/api_provider_imp.dart';
import '../../../../../utils/constant.dart';

class ApiProvider {
  Future<Response> loginOtp(String mobile) async {
    final res = await locator<ApiProviderImp>()
        .post('https://api.texim.ir/api/auth/login-otp', bodyParameter: {
      "mobile": mobile,
      'package_name': Constants.packageName,
      'source': '1',
    });
    return res;
  }

  Future<Response> checkOtp(String mobileNumber, String otpToken) async {
    final checkOtpResponse = await locator<ApiProviderImp>().post(
        'https://api.texim.ir/api/auth/check-otp',
        bodyParameter: {'mobile': mobileNumber, 'token': otpToken});
    return checkOtpResponse;
  }
}


import 'package:dio/dio.dart';

import '../../../../core/error/custome_error.dart';
import '../../../../core/localstorage/local_data.dart';
import '../../../../core/locator/locator.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../../domain/entities/appro_entity.dart';
import '../../domain/entities/check_otp_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/api_provider.dart';
import '../model/appro_model.dart' as appro;
import '../model/check_otp_model.dart' as checkOtpModel;

class AuthRepositoryimpl extends AuthRepository {
  ApiProvider apiProvider;
  AuthRepositoryimpl(this.apiProvider);

  @override
  Future<DataState<String>> loginOtp(String mobile) async {
    Response response = await apiProvider.loginOtp(mobile);

    if (response.statusCode == 200) {
      // print(right('ok'));
      return const DataSuccess('ok');
    } else {
      return DataError(
          errorConvertor(response.statusCode, response.data['message']));
    }
  }

  @override
  Future<DataState<CheckOtpEntity>> checkOtp(OtpParams params) async {
    Response response =
        await apiProvider.checkOtp(params.mobile, params.otpToken);
    if (response.statusCode == 200) {
      CheckOtpEntity checkOtpEntity =
          checkOtpModel.CheckOtpModel.fromJson(response.data);
      await locator<LocalData>().saveApproToken(checkOtpEntity.token!);
      if (checkOtpEntity.user != null) {
        await locator<LocalData>()
            .saveUserMobileNumber(checkOtpEntity.user!.mobile!);
        print(LocalData.userMobileNumberNotifier.value);
      }
      return DataSuccess(checkOtpEntity);
    } else {
      return DataError(
          errorConvertor(response.statusCode, response.data['message']));
    }
  }



}

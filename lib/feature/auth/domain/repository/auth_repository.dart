import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/check_otp_entity.dart';

abstract class AuthRepository {
  Future<DataState<String>> loginOtp(String mobile);
  Future<DataState<CheckOtpEntity>> checkOtp(OtpParams params);
}

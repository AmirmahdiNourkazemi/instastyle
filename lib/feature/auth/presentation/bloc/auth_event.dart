import '../../../../core/usecase/use_case.dart';
import '../../data/model/check_otp_model.dart';

abstract class AuthEvent {}

class LoginOtpEvent extends AuthEvent {
  final String mobile;
  LoginOtpEvent(this.mobile);
}

class CheckOtpEvent extends AuthEvent {
  final OtpParams params;
  CheckOtpEvent(this.params);
}

class SaveUserEvent extends AuthEvent {
  final User user;
  SaveUserEvent(this.user);
}
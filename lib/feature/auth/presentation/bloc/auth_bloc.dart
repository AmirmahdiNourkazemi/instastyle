

import '../../../../core/localstorage/local_data.dart';
import '../../../../core/locator/locator.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../../domain/use_cases/otp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:bloc/bloc.dart';

import 'login_status.dart';
import 'otp_status.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final OtpUsecase otpUsecase;
  AuthBloc(this.loginUsecase, this.otpUsecase)
      : super(
          AuthState(authStatus: LoginInitial(), otpStatus: OtpInitial() ),
        ) {
    on<LoginOtpEvent>((event, emit) async {
      emit(state.copyWith(authStatus: LoginLoading()));
      DataState dataState = await loginUsecase(event.mobile);
      if (dataState is DataSuccess) {
        var res = dataState.data as String;
        
        emit(state.copyWith(authStatus: LoginSuccess(dataState.data)));
      }
      if (dataState is DataError) {
        emit(state.copyWith(authStatus: LoginError(dataState.error!)));
      }
    });

    on<CheckOtpEvent>((event, emit) async {
      emit(state.copyWith(otpStatus: OtpLoading()));
      DataState dataState = await otpUsecase(event.params);
      if (dataState is DataSuccess) {
        emit(state.copyWith(otpStatus: OtpSuccess(dataState.data)));
        var token = LocalData.firstTokenNotifier.value;
         var freeUsage = LocalData.freeUsageCount.value ?? 2;
          await locator<LocalData>().saveFreeUsageCount(freeUsage); 

          var chatMessage = LocalData.storeMessageCount.value ?? 1;
          await locator<LocalData>().saveStoreMessageCount(chatMessage);
          print(LocalData.finalTokenNotifier.value);
      }
      if (dataState is DataError) {
        emit(state.copyWith(otpStatus: OtpError(dataState.error!)));
      }
    });

    
  }
}

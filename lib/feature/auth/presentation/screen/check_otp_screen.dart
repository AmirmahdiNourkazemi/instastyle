import 'package:instastyle/core/widgets/show_toast.dart';
import 'package:instastyle/core/widgets/submit_button.dart';
import 'package:instastyle/utils/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/locator/locator.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../status/presentation/bloc/status_bloc.dart';
import '../../../status/presentation/bloc/status_event.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/otp_status.dart';
import 'login_screen.dart';

Future<void> showOtpButtonSheet(BuildContext context, String mobileNumber) {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return CheckOtpScreen(
          mobileNumber: mobileNumber,
        );
      });
}

class CheckOtpScreen extends StatefulWidget {
  final String mobileNumber;
  const CheckOtpScreen({super.key, required this.mobileNumber});

  @override
  State<CheckOtpScreen> createState() => _CheckOtpScreenState();
}

class _CheckOtpScreenState extends State<CheckOtpScreen> {
  final TextEditingController _otpControllerText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final mobileNumber = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<StatusBloc>(),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.otpStatus is OtpSuccess) {
              BlocProvider.of<StatusBloc>(context).add(StatusInitialEvent());
              Navigator.of(context).pop();
            } else if (state.otpStatus is OtpError) {
              OtpError error = state.otpStatus as OtpError;
              showToast(
                  context, 'خطا', error.message, ToastificationType.error);
            }
          },
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.only(

                bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'کد تایید ارسال شده به شماره موبایل ${widget.mobileNumber}',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: Dimensions.paddingExtraSmall),
                      const IconContainer(
                        icon: MingCute.information_line,
                        padding: 4,
                        size: 22,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Pinput(
                          length: 5,
                          pinAnimationType: PinAnimationType.fade,
                          errorTextStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                          separatorBuilder: (index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          defaultPinTheme: PinTheme(
                            textStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            width: MediaQuery.of(context).size.width / 6,
                            height: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          pinContentAlignment: Alignment.center,
                          animationCurve: Curves.easeInCubic,
                          controller: _otpControllerText,
                          keyboardType: TextInputType.number,
                          closeKeyboardWhenCompleted: true,
                          errorPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          onCompleted: (value) {
                            _otpControllerText.text = value;
                            BlocProvider.of<AuthBloc>(context).add(
                                CheckOtpEvent(OtpParams(widget.mobileNumber,
                                    _otpControllerText.text)));
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'لطفا کد تایید خود را وارد کنید';
                            } else if (value.length != 5) {
                              return 'کد تایید صحیح نمی باشد';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SubmitButton(
                            text: 'ادامه',
                            isLoading: state.authStatus is OtpLoading,
                            onClick: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    CheckOtpEvent(OtpParams(
                                        widget.mobileNumber,
                                        _otpControllerText.text)));
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                showLoginButtonSheet(
                                  context,
                                );
                              },
                              child: Text(
                                'ویرایش شماره',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            // OtpTimerButton(
                            //   buttonType: ButtonType.text_button,
                            //   loadingIndicator: CircularProgressIndicator(
                            //     strokeWidth: 2,
                            //     color: Theme.of(context)
                            //         .colorScheme
                            //         .tertiary,
                            //   ),
                            //   onPressed: () {
                            //     Navigator.of(context)
                            //         .pushReplacementNamed('/login');
                            //   },
                            //   text: Text(
                            //     'ارسال مجدد کد',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .bodyMedium,
                            //   ),
                            //   duration: 60,
                            // ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

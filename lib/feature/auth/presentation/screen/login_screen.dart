import 'package:instastyle/core/locator/locator.dart';
import 'package:instastyle/core/theme/theme.dart';
import 'package:instastyle/core/widgets/custom_text_filled.dart';
import 'package:instastyle/core/widgets/show_toast.dart';
import 'package:instastyle/core/widgets/submit_button.dart';
import 'package:instastyle/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:instastyle/feature/auth/presentation/screen/check_otp_screen.dart';
import 'package:instastyle/utils/icon_container.dart';
import 'package:instastyle/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/login_status.dart';

Future<void> showLoginButtonSheet(BuildContext context) {
  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const LoginScreen();
      });
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController mobileController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthBloc>(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.authStatus is LoginSuccess) {
              Navigator.of(context).pop();
              showOtpButtonSheet(context, mobileController.text);
            } else if (state.authStatus is LoginError) {
              LoginError error = state.authStatus as LoginError;
              showToast(
                context,
                'خطا',
                error.message,
                ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const IconContainer(
                        icon: MingCute.information_line,
                        padding: 4,
                        size: 22,
                      ),
                      const SizedBox(width: Dimensions.paddingExtraSmall),
                      Text(
                        'برای ورود شماره موبایل خود را وارد کنید',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.marginMedium),
                  Form(
                      key: _loginForm,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: mobileController,
                            title: 'شماره موبایل',
                            textInputType: TextInputType.phone,
                            validator: Validation.validateMobile,
                            suffixIcon: const Icon(
                              MingCute.phone_line,
                            ),
                            maxLength: 11,
                          ),
                          const SizedBox(height: Dimensions.marginMedium),
                          SubmitButton(
                              text: 'تایید',
                              isLoading: state.authStatus is LoginLoading,
                              onClick: () {
                                if (_loginForm.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      LoginOtpEvent(mobileController.text));
                                }
                              }),
                          const SizedBox(height: Dimensions.marginSmall),
                        ],
                      )),
                  const SizedBox(height: Dimensions.marginSmall),
                  TextButton.icon(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://doc-hosting.flycricket.io/texim-privacy-policy/703ad776-8974-49d5-8709-44816f09a716/privacy'));
                    },
                    label: Text(
                      'شرایط و قوانین',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    icon: const Icon(MingCute.user_security_line),
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

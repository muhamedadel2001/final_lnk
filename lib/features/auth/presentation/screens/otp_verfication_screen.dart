import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/auth/presentation/widgets/pin_widget_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/const.dart';
import '../../../../core/widgets/primary_button.dart';
import '../manager/auth_cubit.dart';
import '../widgets/box_text_field.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class OtpVerificationScreen extends StatefulWidget {
  final String isRegister;
  const OtpVerificationScreen({super.key, required this.isRegister});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();

  late AuthCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<AuthCubit>(context);
    pinOtpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpFormKey.currentState?.dispose();
    pinOtpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('otp');
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            key: _otpFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: SingleChildScrollView(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is VerifySuccess) {
                      CustomAlerts.showMySuccessSnackBar(
                        context,
                        LangKeys.otpVerified,
                      );
                      if (widget.isRegister == 'true') {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          screens.loginScreen,
                          (route) => false,
                        );
                      } else {
                        Navigator.pushNamed(
                          context,
                          screens.changePassScreen,
                          arguments: cubit,
                        );
                      }
                    }
                    if (state is VerifyError) {
                      CustomAlerts.showMySnackBar(context, state.error);
                    }
                    if (state is ResendSuccess) {
                      CustomAlerts.showMySuccessSnackBar(
                        context,
                        LangKeys.sendSuccess,
                      );
                    }
                  },
                  builder: (context, state) {
                    print('otp builder');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 18.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80.sp),
                          child: Image.asset(kLogo, width: 80.w, height: 80.w),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          LangKeys.verifyCode,
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: 219.w,
                          child: Text(
                            LangKeys.verifyCodeDes,
                            style: getStyle13(context).copyWith(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 60.h),
                        PinWidgetOtp(),
                        SizedBox(height: 40.h),

                        SizedBox(height: 40.h),
                        PrimaryButton(
                          callBack:
                              () => {
                                if (_otpFormKey.currentState!.validate() &&
                                    pinOtpController.text.length >= 4 &&
                                    pinOtpController.text.trim().isNotEmpty)
                                  {cubit.verify()},
                              },
                          text: LangKeys.submit,
                        ),
                        SizedBox(height: 42.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(LangKeys.didntReceive),
                            InkWell(
                              onTap: () {
                                cubit.resendPass(text: emailController);
                              },
                              child: Text(
                                LangKeys.resend,
                                style: getStyleBold13(
                                  context,
                                ).copyWith(color: primaryClr),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//219 32*/

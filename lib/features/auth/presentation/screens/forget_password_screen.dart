import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/const.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';
import '../manager/auth_cubit.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    form.currentState?.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SingleChildScrollView(
              child: Form(
                key: form,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is OtpSuccess) {
                      Navigator.pushNamed(
                        context,
                        screens.otpScreen,
                        arguments: {"cubit": authCubit, "isRegister": 'false'},
                      );
                      CustomAlerts.showMySuccessSnackBar(
                        context,
                        LangKeys.sendSuccess,
                      );
                    } else if (state is OtpError) {
                      CustomAlerts.showMySnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: RespCalc().heightRatio(18)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80.sp),
                          child: Image.asset(kLogo, width: 80.w, height: 80.h),
                        ),
                        SizedBox(height: RespCalc().heightRatio(30)),
                        Text(
                          LangKeys.forgetPassTitle,
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: RespCalc().heightRatio(90)),
                        Text(
                          LangKeys.forgetPassDes,
                          style: getStyle13(context).copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: RespCalc().heightRatio(42)),
                        TitledCustomTextField(
                          validator: Validations.emailValidation,
                          keyboardType: TextInputType.emailAddress,
                          title: LangKeys.email,
                          controller: emailController,
                        ),
                        SizedBox(height: RespCalc().heightRatio(92)),
                        PrimaryButton(
                          callBack:
                              () => {
                                if (form.currentState!.validate())
                                  {
                                    authCubit.forgetPassword(
                                      text: emailController,
                                    ),
                                  },
                              },
                          text: LangKeys.sendCode,
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

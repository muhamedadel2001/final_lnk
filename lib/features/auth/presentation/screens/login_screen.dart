import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> form = GlobalKey();
  late TextEditingController phoneLoginController;
  late TextEditingController passwordLoginController;
  @override
  void initState() {
    print('hiiii');
    phoneLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneLoginController.dispose();
    passwordLoginController.dispose();
    form.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('login');
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 18.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80.sp),
                      child: Image.asset(kLogo, width: 80.w, height: 80.w),
                    ),
                    SizedBox(height: 35.h),
                    Text(LangKeys.signIn, style: getStyle39(context)),
                    SizedBox(height: 35.h),
                    TitledCustomTextField(
                      validator: Validations.egyptianPhoneValidation,
                      keyboardType: TextInputType.number,
                      title: LangKeys.phoneNumber,
                      controller: phoneLoginController,
                    ),
                    SizedBox(height: 30.h),
                    TitledCustomTextField(
                      validator: Validations.passwordValidation,
                      title: LangKeys.password,
                      controller: passwordLoginController,
                      obsecureText: true,
                    ),
                    SizedBox(height: 20.h),
                    /*   const Align(
                      alignment: Alignment.centerLeft,
                      child: RememberMeBox(),
                    ),*/
                    SizedBox(height: 30.h),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            screens.homeLandingScreen,
                            (route) => false,
                          );
                        } else if (state is LoginError) {
                          CustomAlerts.showMySnackBar(context, state.error);
                        }
                      },
                      buildWhen: (previous, current) {
                        return current is LoginLoading || current is LoginError;
                      },
                      builder: (context, state) {
                        print('login after build');
                        return PrimaryButton(
                          callBack: () {
                            if (form.currentState!.validate()) {
                              authCubit.login(
                                email: phoneLoginController.text,
                                password: passwordLoginController.text,
                              );
                            }
                          },
                          text: state is LoginLoading ? "..." : LangKeys.signIn,
                        );
                      },
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(LangKeys.dontHave),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              screens.selectAccTypeScreen,
                              arguments: AuthCubit.get(context),
                            );
                          },
                          child: Text(
                            LangKeys.signUp,
                            style: getStyleBold13(
                              context,
                            ).copyWith(color: primaryClr),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          screens.forgetScreen,
                          arguments: authCubit,
                        );
                      },
                      child: Text(
                        LangKeys.forgetPass,
                        style: getStyleBold13(context).copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

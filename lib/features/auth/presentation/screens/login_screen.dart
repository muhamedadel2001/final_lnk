import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:final_lnk/test.dart';
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
  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('login');
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
                    SizedBox(height: RespCalc().heightRatio(18)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80.sp),
                      child: Image.asset(kLogo, width: 80.w, height: 80.h),
                    ),
                    SizedBox(height: RespCalc().heightRatio(35)),
                    Text(LangKeys.signIn, style: getStyle39(context)),
                    SizedBox(height: RespCalc().heightRatio(35)),
                    TitledCustomTextField(
                      validator: Validations.egyptianPhoneValidation,
                      keyboardType: TextInputType.number,
                      title: LangKeys.phoneNumber,
                      controller: phoneController,
                    ),
                    SizedBox(height: RespCalc().heightRatio(30)),
                    TitledCustomTextField(
                      validator: Validations.passwordValidation,
                      title: LangKeys.password,
                      controller: passwordController,
                      obsecureText: true,
                    ),
                    SizedBox(height: RespCalc().heightRatio(20)),
                    /*   const Align(
                      alignment: Alignment.centerLeft,
                      child: RememberMeBox(),
                    ),*/
                    SizedBox(height: RespCalc().heightRatio(30)),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          /*  Navigator.of(context).pushNamedAndRemoveUntil(
                              kHome,
                              (Route<dynamic> route) => false,
                            );*/
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestScreen(),
                            ),
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
                                email: phoneController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: state is LoginLoading ? "..." : LangKeys.signIn,
                        );
                      },
                    ),
                    SizedBox(height: RespCalc().heightRatio(19)),
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
                    SizedBox(height: RespCalc().heightRatio(19)),
                    InkWell(
                      onTap: () {
                        //  Navigator.of(context).pushNamed(kForgetPassword),
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

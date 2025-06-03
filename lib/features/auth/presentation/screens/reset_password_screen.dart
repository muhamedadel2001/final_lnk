import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/const.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    form.currentState?.dispose();
    super.dispose();
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
                    if (state is ChangeSuccess) {
                      CustomAlerts.showMySuccessSnackBar(
                        context,
                        LangKeys.resetPasswordSuccess,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        screens.loginScreen,
                        (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 18.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80.sp),
                          child: Image.asset(kLogo, width: 80.w, height: 80.w),
                        ),
                        SizedBox(height: 35.h),
                        Text(
                          LangKeys.resetPassword,
                          style: getStyle39(context).copyWith(fontSize: 31),
                        ),
                        SizedBox(height: 35.h),
                        TitledCustomTextField(
                          obsecureText: true,
                          title: LangKeys.password,
                          controller: passwordController,
                          validator: Validations.passwordValidation,
                        ),
                        SizedBox(height: 250.h),
                        PrimaryButton(
                          callBack: () {
                            if (form.currentState!.validate()) {
                              authCubit.changePass();
                            }
                          },
                          text:
                              state is ChangeLoading ? "..." : LangKeys.submit,
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

/*
import 'package:flutter/material.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/const.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/widgets/primary_button.dart';
import 'package:lnk/core/widgets/titled_custom_text_field.dart';
import 'package:lnk/generated/l10n.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: RespCalc().heightRatio(18)),
                Image.asset(kLogo),
                SizedBox(height: RespCalc().heightRatio(35)),
                Text(S.of(context).ResetPass,
                    style: style39.copyWith(fontSize: 31)),
                SizedBox(height: RespCalc().heightRatio(35)),
                TitledCustomTextField(
                    obsecureText: true,
                    title: S.of(context).Password,
                    controller: TextEditingController()),
                SizedBox(height: RespCalc().heightRatio(30)),
                TitledCustomTextField(
                    title: S.of(context).ConfirmPassword,
                    controller: TextEditingController(),
                    obsecureText: true),
                SizedBox(height: RespCalc().heightRatio(40)),
                PrimaryButton(callBack: () {}, text: S.of(context).SignIn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

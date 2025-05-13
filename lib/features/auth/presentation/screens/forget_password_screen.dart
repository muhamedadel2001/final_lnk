/*
import 'package:flutter/material.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/const.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/util/screens.dart';
import 'package:lnk/core/widgets/primary_button.dart';
import 'package:lnk/core/widgets/titled_custom_text_field.dart';
import 'package:lnk/generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                SizedBox(height: RespCalc().heightRatio(30)),
                Text(S.of(context).ForgetPass,
                    style: style20.copyWith(
                        fontSize: 23, fontWeight: FontWeight.w700)),
                SizedBox(height: RespCalc().heightRatio(90)),
                Text(
                  S.of(context).forgetPassTitleOtp,
                  style: style13,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: RespCalc().heightRatio(42)),
                TitledCustomTextField(
                    keyboardType: TextInputType.number,
                    title: S.of(context).EnterNumber,
                    controller: TextEditingController()),
                SizedBox(height: RespCalc().heightRatio(92)),
                PrimaryButton(
                    callBack: () => Navigator.of(context)
                        .pushNamed(kOtp, arguments: {'isReg': false}),
                    text: S.of(context).SendCode),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

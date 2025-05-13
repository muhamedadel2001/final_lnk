/*
import 'package:flutter/material.dart';
import 'package:lnk/core/logic/resp_calc.dart';
import 'package:lnk/core/util/colors.dart';
import 'package:lnk/core/util/const.dart';
import 'package:lnk/core/util/fonts.dart';
import 'package:lnk/core/util/screens.dart';
import 'package:lnk/core/widgets/primary_button.dart';
import 'package:lnk/features/auth/presentation/widgets/box_text_field.dart';
import 'package:lnk/generated/l10n.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key, required this.isReg});
  final bool isReg;
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
                Text(S.of(context).VerifyCode,
                    style: style20.copyWith(
                        fontSize: 23, fontWeight: FontWeight.w700)),
                SizedBox(height: RespCalc().heightRatio(30)),
                SizedBox(
                  width: RespCalc().widthRatio(219),
                  child: Text(
                    '${S.of(context).VerficatoinCodeTitleOtp}--------1234',
                    style: style13,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: RespCalc().heightRatio(60)),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxTextField(
                        controller: TextEditingController(),
                      ),
                      BoxTextField(
                        controller: TextEditingController(),
                      ),
                      BoxTextField(
                        controller: TextEditingController(),
                      ),
                      BoxTextField(
                        controller: TextEditingController(),
                      ),
                      // BoxTextField(
                      //   controller: TextEditingController(),
                      // ),
                      // BoxTextField(
                      //   controller: TextEditingController(),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: RespCalc().heightRatio(40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Expires in ',
                      style: styleBold13,
                    ),
                    Text(
                      '04:15',
                      style: style13,
                    ),
                  ],
                ),
                SizedBox(height: RespCalc().heightRatio(40)),
                PrimaryButton(
                    callBack: () =>
                        Navigator.of(context).pushNamed(kResetPassword),
                    text: S.of(context).Submit),
                SizedBox(height: RespCalc().heightRatio(42)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).HaveNotReceivedCode),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        ' ${S.of(context).Resend}',
                        style: styleBold13.copyWith(color: primaryClr),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//219 32*/

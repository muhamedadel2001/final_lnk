import 'package:final_lnk/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/util/const.dart';
import '../../../../core/util/lang_keys.dart';

class PinWidgetOtp extends StatelessWidget {
  const PinWidgetOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 40.h,
      margin: EdgeInsets.all(5),
      textStyle: TextStyle(fontSize: 22.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: primaryClr),
      ),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinOtpController,
        validator: (value) {
          if (value!.isEmpty) {
            return LangKeys.fieldRequired;
          }
          return null;
        },
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(),
        ),
        onCompleted: (pin) {
          pinOtpController.text = pin;
        },
      ),
    );
  }
}

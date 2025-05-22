import 'package:flutter/material.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';
import '../util/fonts.dart';

class CheckPrimaryButton extends StatelessWidget {
  const CheckPrimaryButton({
    super.key,
    this.backgroundClr,
    this.circularRadius,
    this.foregroundClr,
    this.height,
    this.horizontalPadding,
    this.style,
    this.text,
    this.verticalPadding,
    this.width,
  });
  final Color? backgroundClr;
  final Color? foregroundClr;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? style;
  final double? width;
  final double? height;
  final double? circularRadius;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundClr ?? primaryClr.withOpacity(0.3),
        foregroundColor: foregroundClr ?? Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 40,
          vertical: verticalPadding ?? 16,
        ),
        textStyle: getStyle20(context),
        minimumSize: Size(
          RespCalc().widthRatio(width ?? 260),
          RespCalc().heightRatio(height ?? 62),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(circularRadius ?? 15),
        ),
      ).copyWith(
        overlayColor: WidgetStateProperty.all(
          Colors.transparent,
        ), // منع تأثير الضغط
        shadowColor: WidgetStateProperty.all(
          Colors.transparent,
        ), // منع الظل عند الضغط
        elevation: WidgetStateProperty.all(0), // منع رفع الزرار وقت الضغط
      ),
      child: Text(text ?? 'UnTitled', style: style ?? getStyle20(context)),
    );
  }
}

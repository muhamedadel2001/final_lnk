import 'package:flutter/material.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';
import '../util/fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    required this.callBack,
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
  final Function() callBack;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callBack();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundClr ?? primaryClr,
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
          side: BorderSide(color: primaryClr),
          borderRadius: BorderRadius.circular(circularRadius ?? 15),
        ),
      ),
      child: Text(text ?? 'UnTitled', style: style ?? getStyle20(context)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/resp_calc.dart';
import '../util/fonts.dart';
import 'custom_text_field.dart';

class TitledCustomTextField extends StatelessWidget {
  const TitledCustomTextField({
    super.key,
    required this.title,
    this.style,
    this.labelStyle,
    this.obsecureText,
    this.borderClr,
    this.textHeight,
    this.cursourHeight,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.suffixText,
    this.maxLines,
    this.maxLength,
    this.validator,
  });
  final String title;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? obsecureText;
  final Color? borderClr;
  final double? textHeight;
  final double? cursourHeight;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? suffixText;
  final int? maxLines;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: labelStyle ?? getStyle20(context)),
        SizedBox(height: 12.h),
        CustomTextField(
          validator: validator,
          controller: controller,
          obsecureText: obsecureText,
          keyboardType: keyboardType,
          hintText: hintText,
        ),
      ],
    );
  }
}

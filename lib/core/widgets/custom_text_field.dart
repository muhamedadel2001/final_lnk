import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.style,
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

  final TextStyle? style;
  final String? Function(String?)? validator;
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
    return SizedBox(
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        style: getStyle16(
          context,
        ).copyWith(color: textSecondaryClr, height: textHeight ?? 1.25.h),
        //text height -> 2.5,
        cursorHeight: cursourHeight ?? 30.h,
        obscureText: obsecureText ?? false,
        enableSuggestions: true,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle: getStyleBold13(
            context,
          ).copyWith(color: textSecondaryClr),
          hintText: hintText ?? '',
          hintStyle: getStyle16(context).copyWith(color: Colors.grey[400]),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderClr ?? primaryClr, width: 1.6),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderClr ?? primaryClr, width: 1.6),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.red, width: 1.6),
          ),
        ),
      ),
    );
  }
}

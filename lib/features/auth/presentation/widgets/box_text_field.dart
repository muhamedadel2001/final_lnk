import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';

class BoxTextField extends StatelessWidget {
  const BoxTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 9, right: 9),
      width: 61.w,
      height: 60.h,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        // validator: validator,
        onChanged: (val) {
          if (val.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: getStyleBold16(context),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: customOutlinedBorder(),
          focusedBorder: customOutlinedBorder(),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}

customOutlinedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.42),
    borderSide: customBorderSide(),
  );
}

BorderSide customBorderSide() {
  return BorderSide(width: 1.26, color: primaryClr, style: BorderStyle.solid);
}

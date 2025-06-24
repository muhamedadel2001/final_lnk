import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/lang_keys.dart';

void showCustomDialog(
  BuildContext context,
  String message,
  void Function()? onTap,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Text(message, style: getStyleBold16(context)),
        actions: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              "${LangKeys.yes}",
              style: getStyleBold13(context).copyWith(color: Colors.green),
            ),
          ),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "${LangKeys.cancel}",
              style: getStyleBold13(context).copyWith(color: Colors.redAccent),
            ),
          ),
        ],
      );
    },
  );
}

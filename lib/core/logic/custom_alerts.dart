import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CustomAlerts {
  static showMySnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: getStyle13(context).copyWith(color: backgroundClr),
        ),
        backgroundColor: dangerClr,
      ),
    );
  }
}

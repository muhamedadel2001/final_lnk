import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/colors.dart';

class BottomAppBarr extends StatelessWidget implements PreferredSizeWidget {
  const BottomAppBarr({
    super.key,
    required this.title,
    required this.widgetHeight,
  });
  final String title;
  final double widgetHeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getStyleBold13(context).copyWith(color: textSecondaryClr),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(widgetHeight);
}

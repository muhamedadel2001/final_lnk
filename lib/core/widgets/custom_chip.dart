import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    this.clr,
    required this.deleteCallBack,
  });
  final String label;
  final Color? clr;
  final void Function() deleteCallBack;
  @override
  Widget build(BuildContext context) {
    return Chip(
      onDeleted: deleteCallBack,
      side: BorderSide.none,
      backgroundColor: accentClr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      label: Text(
        label,
        style: getStyleBold13(context).copyWith(color: textSecondaryClr),
      ),
    );
  }
}

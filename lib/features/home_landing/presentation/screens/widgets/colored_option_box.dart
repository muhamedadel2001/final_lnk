import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class ColoredOptionBox extends StatelessWidget {
  const ColoredOptionBox({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? primaryClr : backgroundClr,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.5, color: primaryClr),
        ),
        child: Center(
          child: Text(
            title,
            style: getStyleBold13(context).copyWith(color: textSecondaryClr),
          ),
        ),
      ),
    );
  }
}

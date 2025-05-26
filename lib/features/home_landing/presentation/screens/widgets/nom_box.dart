import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class NomBox extends StatelessWidget {
  const NomBox({
    super.key,
    required this.title,
    this.borderRadiusValue,
    required this.isSelected,
  });
  final String title;
  final double? borderRadiusValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 62,
      decoration: BoxDecoration(
        color: isSelected ? primaryClr : backgroundClr,
        border: Border.all(color: primaryClr),
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 16),
      ),
      child: Center(
        child: Text(
          title,
          style: getStyleBold16(
            context,
          ).copyWith(color: isSelected ? backgroundClr : textSecondaryClr),
        ),
      ),
    );
  }
}

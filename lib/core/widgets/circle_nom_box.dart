import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/fonts.dart';

class CircleNomBox extends StatelessWidget {
  const CircleNomBox({
    super.key,
    required this.title,
    this.borderRadiusValue,
    required this.isSelected,
  });
  final int title;
  final bool isSelected;
  final double? borderRadiusValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        color: isSelected ? primaryClr : backgroundClr,
        border: Border.all(color: primaryClr, width: 2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$title',
          style: getStyleBold16(
            context,
          ).copyWith(color: isSelected ? backgroundClr : textSecondaryClr),
        ),
      ),
    );
  }
}

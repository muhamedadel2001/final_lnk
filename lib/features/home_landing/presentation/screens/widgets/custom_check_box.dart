import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      // padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE0E0E0), width: 1.4),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child:
            isSelected
                ? Icon(Icons.check, color: primaryClr, size: 20)
                : SizedBox(width: 0, height: 0),
      ),
    );
  }
}

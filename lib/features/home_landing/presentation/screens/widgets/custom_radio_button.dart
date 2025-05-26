import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 17,
      height: 17,
      padding: const EdgeInsets.all(2.7),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryClr, width: 2),
      ),
      child: Container(
        decoration: BoxDecoration(color: primaryClr, shape: BoxShape.circle),
      ),
    );
  }
}

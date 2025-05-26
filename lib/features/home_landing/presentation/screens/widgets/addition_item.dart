import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import 'custom_check_box.dart';

class AdditionItem extends StatelessWidget {
  const AdditionItem({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCheckBox(isSelected: isSelected),
        const SizedBox(width: 7),
        Text(title, style: getStyle16(context)),
      ],
    );
  }
}

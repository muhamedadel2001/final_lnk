import 'package:flutter/material.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';
import '../util/fonts.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.dropDownList,
    required this.callBack,
    required this.hintText,
    this.title,
    this.hintStyle,
    this.dropIcon,
    this.fillColor,
    this.iconColor,
    this.value,
  });
  final String? title;
  final List<dynamic> dropDownList;
  final void Function(dynamic newValue) callBack;
  final String hintText;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final IconData? dropIcon;
  final Color? iconColor;
  final String? value;
  // final Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      value: value,
      dropdownColor: backgroundClr,
      icon: Icon(
        dropIcon ?? Icons.keyboard_arrow_down_outlined,
        color: iconColor,
      ),
      menuMaxHeight: RespCalc().heightRatio(300),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? backgroundClr,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            getStyle16(context).copyWith(color: textSecondaryClr, height: 1.8),
        labelStyle: getStyle16(context).copyWith(color: accentClr, height: 1.8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryClr, width: 1.6),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryClr, width: 1.6),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items:
          dropDownList.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(value: value, child: Text(value));
          }).toList(),
      onChanged: callBack,
    );
  }
}

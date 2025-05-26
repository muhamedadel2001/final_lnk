import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/resp_calc.dart';
import '../util/fonts.dart';
import 'custom_drop_down_button.dart';

class TitledCustomDropDownButton extends StatelessWidget {
  const TitledCustomDropDownButton({
    super.key,
    required this.title,
    required this.callBack,
    required this.dropDownList,
    required this.hintText,
    this.value,
  });
  final String title;
  final void Function(dynamic val) callBack;
  final List<dynamic> dropDownList;
  final String hintText;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getStyle20(context)),
        SizedBox(height: 12.h),
        CustomDropDownButton(
          value: value,
          title: title,
          dropDownList: dropDownList,
          callBack: callBack,
          hintText: hintText,
        ),
      ],
    );
  }
}

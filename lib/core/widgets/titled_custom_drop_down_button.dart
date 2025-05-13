import 'package:flutter/material.dart';

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
  });
  final String title;
  final void Function(String? val) callBack;
  final List<String> dropDownList;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getStyle20(context)),
        SizedBox(height: RespCalc().heightRatio(12)),
        CustomDropDownButton(
          title: title,
          dropDownList: dropDownList,
          callBack: callBack,
          hintText: hintText,
        ),
      ],
    );
  }
}

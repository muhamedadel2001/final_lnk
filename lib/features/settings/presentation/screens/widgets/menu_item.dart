import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/util/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.iconData,
    required this.title,
    required this.callBack,
    this.imgUrl,
    required this.isDanger,
    required this.hasIcon,
  });
  final bool hasIcon;
  final IconData? iconData;
  final String? imgUrl;
  final String title;
  final bool isDanger;
  final void Function() callBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        constraints: const BoxConstraints(minHeight: 70, maxHeight: 100),
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: const Color(0xffF1F1F1),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 14.w,
              top: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                hasIcon
                    ? (iconData != null
                        ? Icon(iconData, size: 25.sp, color: primaryClr)
                        : Image.asset(imgUrl!, height: 30.h))
                    : const SizedBox(height: 0, width: 0),
                hasIcon
                    ? SizedBox(width: 14.w)
                    : const SizedBox(height: 0, width: 0),
                Text(
                  title,
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: isDanger ? dangerClr : textPrimaryClr),
                ),
                const Spacer(),
                Icon(Icons.chevron_right_sharp, size: 25.w, color: primaryClr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

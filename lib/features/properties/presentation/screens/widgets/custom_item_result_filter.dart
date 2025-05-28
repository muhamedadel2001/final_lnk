import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/fonts.dart';

class CustomItemResultFilter extends StatelessWidget {
  const CustomItemResultFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      height: 40.h,
      decoration: BoxDecoration(
        color: filterResultBorderClr,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.cancel, color: filterResultIconClr),
          ),
          SizedBox(width: 3.w),
          Text('Alexandria', style: getStyleBold13(context)),
        ],
      ),
    );
  }
}

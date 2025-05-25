import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/colors.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello', style: getStyle16(context)),
            Text(userName, style: getStyleBold16(context)),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/imgs/user_circle.png',
                width: 35.w,
                height: 35.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/util/colors.dart';

class CustomAppbarShimmerHome extends StatelessWidget {
  const CustomAppbarShimmerHome({super.key, required this.userName});
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
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  screens.profileScreen,
                  arguments: true,
                );
              },
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

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/colors.dart';
import '../util/screens.dart';
import '../../features/properties/presentation/manager/properties_cubit.dart';
import 'bottom_sliver_app_bar.dart';

class CustomSliverAppBar extends StatelessWidget {
  final void Function() onPressed;
  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      title: Container(
        padding: EdgeInsets.only(left: 0, top: 10.h),
        child: Align(
          alignment:
              context.locale.languageCode == 'en'
                  ? Alignment.topLeft
                  : Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: getStyle20(context)),
              const SizedBox(height: 15),
              Text(
                subTitle,
                style: getStyleBold13(
                  context,
                ).copyWith(color: textSecondaryClr),
              ),
            ],
          ),
        ),
      ),
      expandedHeight: max(100.h, 135.h),
      floating: true,
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      bottom: BottomSliverBar(onPressed: onPressed),
      backgroundColor: const Color(0xffd9e4db),
    );
  }
}

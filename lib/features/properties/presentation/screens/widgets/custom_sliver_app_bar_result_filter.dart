import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/fonts.dart';

class CustomSliverAppBarResultFilter extends StatelessWidget {
  final String title;
  const CustomSliverAppBarResultFilter({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      title: Align(
        alignment:
            context.locale.languageCode == 'en'
                ? Alignment.topLeft
                : Alignment.topRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title, style: getStyle20(context))],
        ),
      ),
      expandedHeight: max(80.h, 80.h),
      floating: true,
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      backgroundColor: const Color(0xffd9e4db),
    );
  }
}

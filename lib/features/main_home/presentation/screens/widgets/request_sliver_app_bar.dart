import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_bottom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';

class RequestSliverAppBar extends StatelessWidget {
  const RequestSliverAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      title: Align(
        alignment:
            context.locale.languageCode == 'en'
                ? Alignment.topLeft
                : Alignment.topRight,
        child: Text(title, style: getStyle20(context)),
      ),
      expandedHeight: max(90.h, 110.h),
      floating: true,
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      bottom: RequestBottomSliverAppBar(),
      backgroundColor: const Color(0xffd9e4db),
    );
  }
}

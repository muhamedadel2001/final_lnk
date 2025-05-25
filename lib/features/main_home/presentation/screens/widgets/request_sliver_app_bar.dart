import 'dart:math';

import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_bottom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/logic/resp_calc.dart';

class RequestSliverAppBar extends StatelessWidget {
  const RequestSliverAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      title: Text(title, style: getStyle20(context)),
      expandedHeight: max(RespCalc().heightRatio(150), 170),
      floating: true,
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      bottom: const RequestBottomSliverAppBar(),
      backgroundColor: const Color(0xffd9e4db),
    );
  }
}

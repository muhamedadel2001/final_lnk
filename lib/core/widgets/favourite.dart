import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key, required this.isLiked});

  final bool isLiked;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isLiked ? secondaryClr : secondaryClr.withOpacity(.2),
          shape: BoxShape.circle,
        ),
        child: Icon(color: Colors.white, Icons.favorite, size: 16.h),
      ),
    );
  }
}

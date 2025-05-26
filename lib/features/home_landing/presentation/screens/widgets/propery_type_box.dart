import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';

class ProperyTypeBox extends StatelessWidget {
  const ProperyTypeBox({
    super.key,
    required this.title,
    required this.imageUrl,
  });
  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Container(
      padding: const EdgeInsets.only(left: 12, bottom: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border:
            title == addPropertyCubit.propertyType
                ? Border.all(color: const Color(0xff495D4D), width: 2)
                : Border.all(color: const Color(0xFFBEBEBE), width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, height: 24.h, width: 24.w),
          const SizedBox(height: 8),
          Text(title, style: getStyleBold13(context)),
        ],
      ),
    );
  }
}

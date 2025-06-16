import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/features/main_home/presentation/manager/main_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/util/colors.dart';

class BannerHomeLoadingWidget extends StatelessWidget {
  const BannerHomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MainHomeCubit.get(context);
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(height: 190.h, width: double.infinity),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: cubit.currentBannerIndex == index ? 20.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color:
                      cubit.currentBannerIndex == index
                          ? primaryClr
                          : Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

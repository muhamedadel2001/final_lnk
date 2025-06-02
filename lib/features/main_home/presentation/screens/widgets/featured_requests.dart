import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_request_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/logic/resp_calc.dart';
import '../../manager/main_home_cubit.dart';
import 'featured_request_item.dart';

class FeaturedRequests extends StatelessWidget {
  const FeaturedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MainHomeCubit.get(context);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150.h, maxHeight: 220.h),
      child: SizedBox(
        height: 220.h,
        child: Skeletonizer(
          enabled: cubit.isLoadingHomeData || cubit.userData == null,
          child: ListView.builder(
            itemBuilder:
                (context, index) =>
                    cubit.userData == null
                        ? const FeaturedRequestItemShimmer()
                        : FeaturedRequestItem(
                          homeRequest: cubit.userData!.homeRequests[index],
                        ),
            itemCount:
                cubit.userData == null
                    ? 5
                    : cubit.userData!.homeRequests.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

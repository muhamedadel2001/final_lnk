import 'package:final_lnk/features/main_home/presentation/manager/main_home_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_properties_item_shimmer.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_property_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedPropeties extends StatelessWidget {
  const FeaturedPropeties({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MainHomeCubit.get(context);
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 225.h, maxHeight: 290.h),
      child: SizedBox(
        height: 290.h,
        child: Skeletonizer(
          enabled: cubit.isLoadingHomeData || cubit.userData == null,
          child: ListView.builder(
            itemBuilder:
                (context, index) =>
                    cubit.isLoadingHomeData
                        ? const FeaturedPropertyItemShimmer()
                        : FeaturedPropertyItem(
                          id: cubit.userData!.homeListing[index].id,
                          homeListing: cubit.userData!.homeListing[index],
                        ),
            itemCount:
                cubit.userData == null ? 5 : cubit.userData!.homeListing.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

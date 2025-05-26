import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';
import 'featured_property_item.dart';

class FeaturedPropeties extends StatelessWidget {
  const FeaturedPropeties({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 225.h, maxHeight: 250.h),
      child: SizedBox(
        height: 250.h,
        child: ListView.builder(
          // clipBehavior: Clip.none,
          itemBuilder: (context, index) => const FeaturedPropertyItem(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

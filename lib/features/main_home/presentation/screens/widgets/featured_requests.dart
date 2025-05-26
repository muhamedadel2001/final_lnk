import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';
import 'featured_request_item.dart';

class FeaturedRequests extends StatelessWidget {
  const FeaturedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150.h, maxHeight: 190.h),
      child: SizedBox(
        height: 190.h,
        child: ListView.builder(
          itemBuilder: (context, index) => const FeaturedRequestItem(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

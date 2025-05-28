import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_item_result_filter.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_sliver_app_bar_result_filter.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/my_request_item.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/request_feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultFilterRequestsScreen extends StatelessWidget {
  const ResultFilterRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBarResultFilter(title: 'Search result'),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60.h,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8.w);
                },
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CustomItemResultFilter();
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return MyRequestItem();
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}

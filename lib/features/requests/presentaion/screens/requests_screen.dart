import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/request_feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/widgets/custom_tab_bar.dart';
import '../../../properties/presentation/screens/widgets/custom_sliver_app_bar.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        // التاب فعلاً اتغير وخلص الحركة

        print('Tab index changed to ${tabController.index}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: 'Available Requests',
            subTitle: 'Browse the Best Deals in the Market',
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(child: CustomTabBar(tabController: tabController)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: context.locale.languageCode == 'en' ? 18 : 0,
                right: context.locale.languageCode == 'en' ? 0 : 18,
              ),
              child: Text(
                '150 requests',
                style: getStyleBold13(
                  context,
                ).copyWith(color: textSecondaryClr),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return const RequestFeedItem();
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}

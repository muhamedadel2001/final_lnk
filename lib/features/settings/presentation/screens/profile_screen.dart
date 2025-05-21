import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/personal_details_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/posts_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/requests_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/lang_keys.dart';

class AgentProfileScreen extends StatefulWidget {
  const AgentProfileScreen({super.key});

  @override
  State<AgentProfileScreen> createState() => _AgentProfileScreenState();
}

class _AgentProfileScreenState extends State<AgentProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Color(0xFFD9E4DB),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new, size: 22.sp),
                      SizedBox(width: 8.w),
                      Container(
                        width: 65.w,
                        height: 65.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/imgs/hoda.jpeg'),
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: geryBorderImageClr,
                            width: 5,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adam mohamed ali',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              LangKeys.freelance,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 0,
            indicatorColor: Colors.red,
            isScrollable: true,
            dividerColor: Colors.transparent,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: primaryClr,
            ),
            tabs: [
              Tab(text: 'Personal details'),
              Tab(text: 'Posts'),
              Tab(text: 'Requests'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [PersonalDetailsTab(), PostsTab(), RequestsTab()],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/accounts_widgets.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/personal_details_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/posts_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/requests_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/lang_keys.dart';

class ProfileScreen extends StatefulWidget {
  final bool isAgency;
  const ProfileScreen({super.key, required this.isAgency});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: widget.isAgency ? 4 : 3,
      vsync: this,
    );
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
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new, size: 22.sp),
                      ),
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
                            width: 3.w,
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
                              style: getStyleBold16(context),
                            ),
                            Text(
                              LangKeys.freelance,
                              style: getStyle13(context),
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
            labelPadding: EdgeInsets.zero,
            labelStyle: getStyle13(context),
            padding: EdgeInsets.symmetric(horizontal: 5),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 0,
            indicatorColor: Colors.red,
            dividerColor: Colors.transparent,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: primaryClr,
            ),
            tabs:
                widget.isAgency
                    ? [
                      Tab(text: LangKeys.personalDetails),
                      Tab(text: LangKeys.posts),
                      Tab(text: LangKeys.requests),
                      Tab(text: LangKeys.accounts),
                    ]
                    : [
                      Tab(text: LangKeys.personalDetails),
                      Tab(text: LangKeys.posts),
                      Tab(text: LangKeys.requests),
                    ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:
                  widget.isAgency
                      ? [
                        PersonalDetailsTab(),
                        PostsTab(),
                        RequestsTab(),
                        AccountsWidgets(),
                      ]
                      : [PersonalDetailsTab(), PostsTab(), RequestsTab()],
            ),
          ),
        ],
      ),
    );
  }
}

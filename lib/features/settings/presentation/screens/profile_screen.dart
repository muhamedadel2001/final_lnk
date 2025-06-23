import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/accounts_widgets.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/personal_details_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/posts_widget.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/requests_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/global_error_widget.dart';

class ProfileScreen extends StatefulWidget {
  final bool isAgency;
  const ProfileScreen({super.key, required this.isAgency});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late SettingsCubit cubit;
  @override
  void initState() {
    cubit = SettingsCubit.get(context);
    cubit.getMyProfile(context: context);
    name = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    _tabController = TabController(
      length: MyCache.getString(key: MyCacheKeys.type) == 'agency' ? 4 : 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    phoneController.dispose();
    emailController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return state is ProfileSuccess ||
                    state is UpdateLoading ||
                    state is UpdateFailure
                ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
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
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 22.sp,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: () {
                                    cubit.updateImageMethod();
                                  },
                                  child: Container(
                                    width: 65.w,
                                    height: 65.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: geryBorderImageClr,
                                        width: 3.w,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        32.5.w,
                                      ),
                                      child:
                                          cubit.profileImage != null
                                              ? Image.file(
                                                cubit.profileImage!,
                                                fit: BoxFit.cover,
                                              )
                                              : cubit.myImage == null
                                              ? Image.asset(
                                                'assets/imgs/user_circle.png',
                                              )
                                              : CachedNetworkImage(
                                                imageUrl:
                                                    "${ApiConstants.userUrlImages}${cubit.myImage}",
                                                fit: BoxFit.cover,
                                              ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name.text,
                                        style: getStyleBold16(context),
                                      ),
                                      Text(
                                        cubit.myTitle ?? '',
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
                          MyCache.getString(key: MyCacheKeys.type) == 'agency'
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
                            MyCache.getString(key: MyCacheKeys.type) == 'agency'
                                ? [
                                  PersonalDetailsTab(),
                                  PostsTab(),
                                  RequestsTab(),
                                  AccountsWidgets(),
                                ]
                                : [
                                  PersonalDetailsTab(),
                                  PostsTab(),
                                  RequestsTab(),
                                ],
                      ),
                    ),
                  ],
                )
                : state is ProfileLoading?
                ? Center(
                  child:
                      Platform.isIOS
                          ? CupertinoActivityIndicator(color: primaryClr)
                          : CircularProgressIndicator(color: primaryClr),
                )
                : Center(
                  child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
                );
          },
        ),
      ),
    );
  }
}

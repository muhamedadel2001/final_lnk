import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/custom_favourite_tab_bar.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/property_fav_item.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/request_fav_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/util/screens.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../properties/presentation/manager/properties_cubit.dart';
import '../../../properties/presentation/screens/widgets/property_item.dart';
import '../../../requests/presentaion/screens/widgets/request_feed_item.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late SettingsCubit settingsCubit;

  @override
  void initState() {
    settingsCubit = SettingsCubit.get(context);
    settingsCubit.getMyFavourite(
      context: context,
      lang: MyCache.getString(key: MyCacheKeys.language),
    );
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        settingsCubit.emit(GetFavouriteSuccess());
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(width: 5.w),
                      Text(LangKeys.favourite, style: getStyle20(context)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return state is GetFavouriteLoading
                  ? Center(
                    child:
                        Platform.isIOS
                            ? CupertinoActivityIndicator(color: primaryClr)
                            : CircularProgressIndicator(color: primaryClr),
                  )
                  : state is GetFavouriteSuccess
                  ? Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        Center(
                          child: CustomFavouriteTabBar(
                            tabController: tabController,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        if (tabController.index == 0)
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: settingsCubit.myFavouriteList.length,
                              itemBuilder: (context, index) {
                                return PropertyFavItem(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      singlePropertyScreen,
                                      arguments: {
                                        'id':
                                            settingsCubit
                                                .myFavouriteList[index]
                                                .sId,
                                        'cubit': HomeLandingCubit.get(context),
                                        "fromProfile": false,
                                      },
                                    );
                                  },
                                  onTapLike: () {
                                    HomeLandingCubit.get(context).addToFav(
                                      id:
                                          settingsCubit
                                              .myFavouriteList[index]
                                              .sId!,
                                      isRequest: false,
                                      context: context,
                                      isSetting: true,
                                    );
                                    settingsCubit.myFavouriteList.removeAt(
                                      index,
                                    );
                                  },
                                  favouritsLists:
                                      settingsCubit.myFavouriteList[index],
                                );
                              },
                            ),
                          ),
                        if (tabController.index == 1)
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount:
                                  settingsCubit.myFavouriteRequest.length,
                              itemBuilder: (context, index) {
                                return RequestFavouriteItem(
                                  onTapLike: () {
                                    HomeLandingCubit.get(context).addToFav(
                                      id:
                                          settingsCubit
                                              .myFavouriteRequest[index]
                                              .sId!,
                                      isRequest: false,
                                      context: context,
                                      isSetting: true,
                                    );
                                    settingsCubit.myFavouriteRequest.removeAt(
                                      index,
                                    );
                                  },
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      singleRequestScreen,
                                      arguments: {
                                        'id':
                                            settingsCubit
                                                .myFavouriteRequest[index]
                                                .sId,
                                        'cubit': HomeLandingCubit.get(context),
                                        "fromProfile": false,
                                      },
                                    );
                                  },
                                  requests:
                                      settingsCubit.myFavouriteRequest[index],
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  )
                  : Center(
                    child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
                  );
            },
          ),
        ],
      ),
    );
  }
}

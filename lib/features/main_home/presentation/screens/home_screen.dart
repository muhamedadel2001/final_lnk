import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/widgets/global_error_widget.dart';
import 'package:final_lnk/features/main_home/presentation/manager/main_home_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/custom_app_bar_shimmer.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/custom_appbar_home.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_propeties.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    MainHomeCubit.get(context).getHomeData(
      lang: MyCache.getString(key: MyCacheKeys.language),
      context: context,
    );
    print('home init');
    super.initState();
  }

  @override
  void dispose() {
    print('close');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MyCache.getString(key: MyCacheKeys.language));
    final cubit = MainHomeCubit.get(context);
    print('home ');
    return Scaffold(
      body: BlocBuilder<MainHomeCubit, MainHomeState>(
        builder: (context, state) {
          print('home after rebuild ');
          return state is GetHomeFailure
              ? Center(
                child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
              )
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      Skeletonizer(
                        enabled:
                            cubit.isLoadingHomeData || cubit.userData == null,
                        child:
                            cubit.isLoadingHomeData
                                ? CustomAppbarShimmerHome(
                                  userName: 'Mohamed adel',
                                )
                                : CustomAppbarHome(
                                  userData: cubit.userData!,
                                  userName:
                                      cubit.userData?.name ?? 'Mohamed adel',
                                ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Skeletonizer(
                            enabled: cubit.isLoadingHomeData,
                            child: Text(
                              LangKeys.propertiesOffered,
                              style: getStyle20(context),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Skeletonizer(
                              enabled: cubit.isLoadingHomeData,
                              child: Text(
                                LangKeys.viewAll,
                                style: getStyle13(
                                  context,
                                ).copyWith(color: textSecondaryClr),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      FeaturedPropeties(),
                      SizedBox(height: 30.h),
                      Skeletonizer(
                        enabled: cubit.isLoadingHomeData,
                        child: Row(
                          children: [
                            Text(
                              LangKeys.propertiesRequested,
                              style: getStyle20(context),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                LangKeys.viewAll,
                                style: getStyle13(
                                  context,
                                ).copyWith(color: textSecondaryClr),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      FeaturedRequests(),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}

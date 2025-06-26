import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/global_error_widget.dart';

class AccountsWidgets extends StatefulWidget {
  const AccountsWidgets({super.key});

  @override
  State<AccountsWidgets> createState() => _AccountsWidgetsState();
}

class _AccountsWidgetsState extends State<AccountsWidgets> {
  @override
  void initState() {
    SettingsCubit.get(
      context,
    ).getMySubAccount(lang: MyCache.getString(key: MyCacheKeys.language));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state is GetMyRequestLoading ||
                state is GetMyListLoading ||
                state is DeleteSubAccountLoading ||
                state is GetOneSubAccountLoading ||
                state is GetMySubAccountLoading?
            ? Center(
              child:
                  Platform.isIOS
                      ? CupertinoActivityIndicator(color: primaryClr)
                      : CircularProgressIndicator(color: primaryClr),
            )
            : state is GetMyRequestSuccess ||
                state is GetMyListSuccess ||
                state is GetMySubAccountSuccess ||
                state is ProfileSuccess ||
                state is GetOneSuccess ||
                state is DeleteSubAccountSuccess ||
                state is GetOneSubAccountSuccess
            ? Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          LangKeys.subAccounts,
                          style: getStyleBold16(context),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          String? isRefresh = await Navigator.pushNamed(
                            context,
                            screens.addSubScreen,
                            arguments: cubit,
                          );
                          if (isRefresh == 'refresh') {
                            cubit.getMySubAccount(
                              lang: MyCache.getString(
                                key: MyCacheKeys.language,
                              ),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF609966)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          LangKeys.addSub,
                          style: getStyleBold13(
                            context,
                          ).copyWith(color: Color(0xFF609966)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: cubit.subAccountModel!.subAccounts!.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    blurRadius: 2.r,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child:
                                        cubit
                                                    .subAccountModel!
                                                    .subAccounts![index]
                                                    .image ==
                                                null
                                            ? Image.asset(
                                              'assets/imgs/user_circle.png',
                                              // حط الصورة المناسبة هنا
                                              height: 40.w,
                                              width: 40.w,
                                              fit: BoxFit.cover,
                                            )
                                            : CachedNetworkImage(
                                              height: 40.w,
                                              width: 40.w,
                                              imageUrl:
                                                  "${ApiConstants.userUrlImages}${cubit.subAccountModel!.subAccounts![index].image}",
                                              fit: BoxFit.cover,
                                            ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          cubit
                                              .subAccountModel!
                                              .subAccounts![index]
                                              .name!,
                                          style: getStyleBold13(context),
                                        ),
                                        Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          cubit
                                              .subAccountModel!
                                              .subAccounts![index]
                                              .email!,
                                          style: getStyle10(
                                            context,
                                          ).copyWith(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () async {
                                      String? isRefresh =
                                          await Navigator.pushNamed(
                                            context,
                                            screens.subAccDetailsScreenScreen,
                                            arguments: {
                                              "id":
                                                  cubit
                                                      .subAccountModel!
                                                      .subAccounts![index]
                                                      .sId!,
                                              "homeLandingCubit":
                                                  HomeLandingCubit.get(context),
                                              "settingsCubit":
                                                  SettingsCubit.get(context),
                                            },
                                          );
                                      if (isRefresh == 'refresh') {
                                        cubit.getMySubAccount(
                                          lang: MyCache.getString(
                                            key: MyCacheKeys.language,
                                          ),
                                        );
                                      }
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: Size(59.w, 22.h),
                                      maximumSize: Size(62.w, 25.h),
                                      side: BorderSide(
                                        color: Color(0xFF609966),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Text(
                                      LangKeys.view,
                                      style: getStyleBold13(
                                        context,
                                      ).copyWith(color: Color(0xFF609966)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            )
            : Center(
              child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
            );
      },
    );
  }
}

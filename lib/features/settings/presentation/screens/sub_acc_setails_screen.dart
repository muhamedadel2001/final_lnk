import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/core/widgets/custom_dialog.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../home_landing/presentation/manager/home_landing_cubit.dart';

class SubAccountDetailsScreen extends StatefulWidget {
  final String id;

  const SubAccountDetailsScreen({super.key, required this.id});

  @override
  State<SubAccountDetailsScreen> createState() =>
      _SubAccountDetailsScreenState();
}

class _SubAccountDetailsScreenState extends State<SubAccountDetailsScreen> {
  @override
  void initState() {
    SettingsCubit.get(context).getOneSubAccount(
      lang: MyCache.getString(key: MyCacheKeys.language),
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is DeleteSubAccountSuccess) {
          Navigator.pop(context, 'refresh');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              state is GetOneSubAccountSuccess
                  ? Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: ElevatedButton(
                      onPressed: () {
                        showCustomDialog(context, LangKeys.deleteSureSub, () {
                          cubit.deleteSubAccount(
                            id: widget.id,
                            context: context,
                          );
                          Navigator.pop(context);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dangerClr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        LangKeys.deleteAcc,
                        style: getStyleBold13(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
            ],
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          body:
              state is GetOneSubAccountLoading ||
                      state is DeleteSubAccountLoading ||
                      state is GetMySubAccountLoading
                  ? Center(
                    child:
                        Platform.isIOS
                            ? CupertinoActivityIndicator(color: primaryClr)
                            : CircularProgressIndicator(color: primaryClr),
                  )
                  : state is GetOneSubAccountSuccess ||
                      state is DeleteSubAccountSuccess ||
                      state is GetMySubAccountSuccess
                  ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            cubit.oneSubAccountModel!.subAccountData!.image ==
                                    null
                                ? Image.asset(
                                  height: 55.w,
                                  width: 55.w,
                                  'assets/imgs/user_circle.png',
                                  fit: BoxFit.cover,
                                )
                                : CachedNetworkImage(
                                  height: 55.w,
                                  width: 55.w,
                                  imageUrl:
                                      "${ApiConstants.userUrlImages}${cubit.oneSubAccountModel!.subAccountData!.image}",
                                  fit: BoxFit.cover,
                                ),

                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit
                                        .oneSubAccountModel!
                                        .subAccountData!
                                        .name!,
                                    style: getStyleBold16(context),
                                  ),
                                  Text(
                                    cubit
                                        .oneSubAccountModel!
                                        .subAccountData!
                                        .email!,
                                    style: getStyle13(context),
                                  ),
                                  Text(
                                    cubit
                                        .oneSubAccountModel!
                                        .subAccountData!
                                        .phone!,
                                    style: getStyle13(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: primaryClr,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            '${LangKeys.role} : ${cubit.oneSubAccountModel!.subAccountData!.title}',
                            style: getStyle13(context),
                          ),
                        ),

                        SizedBox(height: 40.h),
                        Text(
                          LangKeys.recentActivity,
                          style: getStyle20(context),
                        ),
                        SizedBox(height: 16.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                cubit
                                    .oneSubAccountModel!
                                    .subAccountActivity!
                                    .length,
                            itemBuilder: (context, index) {
                              return _buildActivityTile(
                                cubit
                                    .oneSubAccountModel!
                                    .subAccountActivity![index]
                                    .text!,
                                cubit
                                    .oneSubAccountModel!
                                    .subAccountActivity![index]
                                    .date!,
                                context,
                                cubit
                                    .oneSubAccountModel!
                                    .subAccountActivity![index]
                                    .isList!,
                                cubit
                                    .oneSubAccountModel!
                                    .subAccountActivity![index]
                                    .activityId!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  : Center(
                    child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
                  ),
        );
      },
    );
  }

  Widget _buildActivityTile(
    String title,
    String date,
    BuildContext context,
    bool isList,
    String id,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF88A98F), width: 2.w),
                shape: BoxShape.circle,
              ),
              child: Container(
                width: 12.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: primaryClr,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: geryBorderActivityClr, width: 2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(date, style: getStyle16(context)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: getStyleBold16(context)),
                  TextButton(
                    onPressed: () async {
                      String? isRefresh = await Navigator.pushNamed(
                        context,
                        isList ? singlePropertyScreen : singleRequestScreen,
                        arguments: {
                          "cubit": HomeLandingCubit.get(context),
                          "id": id,
                          "fromProfile": true,
                        },
                      );
                      if (isRefresh == 'refresh') {
                        SettingsCubit.get(context).getOneSubAccount(
                          lang: MyCache.getString(key: MyCacheKeys.language),
                          id: widget.id,
                        );
                      }
                    },
                    child: Text(LangKeys.view),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

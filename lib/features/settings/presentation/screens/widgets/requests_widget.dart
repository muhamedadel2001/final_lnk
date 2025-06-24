import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/util/fonts.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/util/screens.dart';
import '../../../../../core/widgets/global_error_widget.dart';
import '../../../../home_landing/presentation/manager/home_landing_cubit.dart';
import '../../../../requests/data/models/requests_model.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  late SettingsCubit cubit;

  @override
  void initState() {
    cubit = SettingsCubit.get(context);
    cubit.getMyRequest(lang: MyCache.getString(key: MyCacheKeys.language));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state is GetMyRequestLoading || state is GetMyListLoading?
            ? Center(
              child:
                  Platform.isIOS
                      ? CupertinoActivityIndicator(color: primaryClr)
                      : CircularProgressIndicator(color: primaryClr),
            )
            : state is GetMyRequestSuccess || state is GetMyListSuccess
            ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    "${cubit.myRequestModel!.count} ${LangKeys.items}",
                    style: getStyle13(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 20.h),
                      itemCount: cubit.myRequestModel!.requests!.length,
                      itemBuilder:
                          (context, index) => RequestCard(
                            requests: cubit.myRequestModel!.requests![index],
                            onTap: () async {
                              String? isRefresh = await Navigator.pushNamed(
                                context,
                                singleRequestScreen,
                                arguments: {
                                  'id':
                                      cubit
                                          .myRequestModel!
                                          .requests![index]
                                          .sId,
                                  'cubit': HomeLandingCubit.get(context),
                                  "fromProfile": true,
                                },
                              );
                              if (isRefresh == 'refresh') {
                                cubit.getMyRequest(
                                  lang: MyCache.getString(
                                    key: MyCacheKeys.language,
                                  ),
                                );
                              }
                            },
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

class RequestCard extends StatelessWidget {
  final MyRequests requests;
  final void Function()? onTap;
  const RequestCard({super.key, required this.requests, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            requests.title!,
            style: getStyleBold13(context),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: primaryClr, size: 15.sp),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  requests.location!.name!,
                  style: getStyle10(context),
                ),
              ),
              SvgPicture.asset('assets/imgs/range.svg', width: 15.w),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "${requests.minPrice} : ${requests.maxPrice}",
                  style: getStyle10(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.check_circle_outline, size: 15.sp, color: primaryClr),
              Expanded(
                child: Text(
                  requests.finishing!.name!,
                  style: getStyle10(context),
                ),
              ),
              SvgPicture.asset('assets/imgs/distance.svg', width: 15.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  requests.area!,
                  style: getStyle10(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: onTap,
            child: Align(
              alignment:
                  context.locale.languageCode == 'en'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  LangKeys.view,
                  style: getStyle10(context).copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

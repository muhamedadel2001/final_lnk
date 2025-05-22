import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/util/fonts.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestsTab extends StatelessWidget {
  const RequestsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            Text(
              "${context.locale.languageCode == 'ar' ? '٤' : '4'} ${LangKeys.items}",
              style: getStyle13(context),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 20.h),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) => RequestCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

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
            "Request for Residential Apartment in New Cairo",
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
                  "sidi bishr",
                  style: getStyle10(context),
                ),
              ),
              SvgPicture.asset('assets/imgs/range.svg', width: 15.w),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "1.500.000 : 2.000.000",
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
                child: Text(" Fully Finishing", style: getStyle10(context)),
              ),
              SvgPicture.asset('assets/imgs/distance.svg', width: 15.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "400m",
                  style: getStyle10(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Align(
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
                "View",
                style: getStyle10(context).copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

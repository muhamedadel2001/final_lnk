import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';

class MyListItemSimilar extends StatelessWidget {
  final void Function()? onTap;
  final SimilarList lists;
  const MyListItemSimilar({super.key, required this.lists, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7),
      padding: const EdgeInsets.only(top: 14, left: 16, bottom: 12, right: 14),
      decoration: BoxDecoration(
        color: backgroundClr,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: -5,
            blurRadius: 10,
            offset: Offset(-2, 9),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lists.title,
            // maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getStyleBold16(context),
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              Image.asset(
                'assets/imgs/properties_icons/green_location.png',
                height: 14.h,
                width: 14.w,
              ),
              SizedBox(width: 2.w),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: SizedBox(
                  width: 100.w,
                  child: Text(
                    lists.location.name!,
                    style: getStyleBold13(
                      context,
                    ).copyWith(color: textSecondaryClr),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Image.asset(
                'assets/imgs/properties_icons/green_dollar.png',
                height: 14.h,
                width: 14.w,
              ),
              SizedBox(width: 2.w),
              Flexible(
                child: Text(
                  lists.price,
                  style: getStyleBold13(
                    context,
                  ).copyWith(color: textSecondaryClr),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              Image.asset(
                'assets/imgs/properties_icons/green_finishing.png',
                height: 14.h,
                width: 14.w,
              ),
              SizedBox(width: 3.w),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: SizedBox(
                  width: 100.w,
                  child: Text(
                    lists.finishing.name!,
                    style: getStyleBold13(
                      context,
                    ).copyWith(color: textSecondaryClr),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Image.asset(
                'assets/imgs/properties_icons/green_area.png',
                height: 14.h,
                width: 14.w,
              ),
              SizedBox(width: 2.w),
              Flexible(
                child: Text(
                  lists.area,
                  style: getStyleBold13(
                    context,
                  ).copyWith(color: textSecondaryClr),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryClr,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  LangKeys.view,
                  style: getStyle10(context).copyWith(fontSize: 10.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

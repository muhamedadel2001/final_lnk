import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/settings/data/model/my_favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/favourite.dart';

class RequestFavouriteItem extends StatelessWidget {
  final FavouritsRequests requests;
  final void Function()? onTap;
  final void Function()? onTapLike;
  const RequestFavouriteItem({
    super.key,
    required this.requests,
    this.onTap,
    this.onTapLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              requests.userId!.image == null && requests.agencyId!.image == null
                  ? Row(
                    children: [
                      Image.asset(
                        'assets/imgs/user_circle.png',
                        width: 40.w,
                        height: 40.w,
                      ),
                    ],
                  )
                  : requests.userId!.image == null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${requests.agencyId!.image}",
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${requests.userId!.image}",
                    ),
                  ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      requests.userId!.name!,
                      style: getStyleBold13(context),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      requests.titleOfUser!,
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr, fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTapLike,
                child: Favourite(isLiked: true),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 7, bottom: 7),
            padding: const EdgeInsets.only(
              top: 14,
              left: 16,
              bottom: 12,
              right: 14,
            ),
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
                  requests.title!,
                  maxLines: 2,
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
                          requests.location!.name!,
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
                        "${requests.minPrice} : ${requests.maxPrice}",
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
                          requests.finishing!.name!,
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
                        requests.area!,
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
          ),
        ],
      ),
    );
  }
}

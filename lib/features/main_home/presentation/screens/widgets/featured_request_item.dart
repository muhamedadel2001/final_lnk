import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/home_landing.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';

class FeaturedRequestItem extends StatelessWidget {
  final String id;
  final HomeRequest homeRequest;
  const FeaturedRequestItem({
    super.key,
    required this.homeRequest,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          screens.singleRequestScreen,
          arguments: {"cubit": HomeLandingCubit.get(context), "id": id},
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350.w, minWidth: 220.w),
        child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 0),
          padding: const EdgeInsets.only(
            left: 12,
            right: 10,
            top: 14,
            bottom: 12,
          ),
          width: 250.w,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeRequest.userId.image == null &&
                      homeRequest.agencyId.image == null
                  ? Row(
                    children: [
                      Image.asset(
                        'assets/imgs/user_circle.png',
                        width: 40.w,
                        height: 40.w,
                      ),
                    ],
                  )
                  : homeRequest.userId.image == null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${homeRequest.agencyId.image}",
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${homeRequest.userId.image}",
                    ),
                  ),
              SizedBox(height: 5.h),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.topLeft
                                : Alignment.topRight,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            homeRequest.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getStyleBold13(
                              context,
                            ).copyWith(fontSize: 14.sp),
                          ),
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/imgs/properties_icons/location.png',
                              height: 20.h,
                              width: 12.w,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 120.w),
                              child: SizedBox(
                                width: 100.w,
                                child: Text(
                                  homeRequest.location.name,
                                  style: getStyleBold13(
                                    context,
                                  ).copyWith(color: textSecondaryClr),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Image.asset(
                              'assets/imgs/properties_icons/range.png',
                              height: 20.h,
                              width: 12.w,
                            ),
                            Flexible(
                              child: Text(
                                "${homeRequest.minPrice}-${homeRequest.maxPrice}",
                                style: getStyleBold13(
                                  context,
                                ).copyWith(color: textSecondaryClr),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/imgs/properties_icons/finishing.png',
                              height: 20.h,
                              width: 12.w,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 120.w),
                              child: SizedBox(
                                width: 100.w,
                                child: Text(
                                  homeRequest.finishing.name,
                                  style: getStyleBold13(
                                    context,
                                  ).copyWith(color: textSecondaryClr),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Image.asset(
                              'assets/imgs/properties_icons/area.png',
                              height: 20.h,
                              width: 12.w,
                            ),
                            Flexible(
                              child: Text(
                                homeRequest.area,
                                style: getStyleBold13(
                                  context,
                                ).copyWith(color: textSecondaryClr),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Favourite(isLiked: homeRequest.isFavourite),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/logic/intl_logic.dart';
import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';
import '../../../../home_landing/presentation/manager/home_landing_cubit.dart';
import '../../../data/models/user_model.dart';

class FeaturedPropertyItem extends StatelessWidget {
  final String id;
  final HomeListing homeListing;
  const FeaturedPropertyItem({
    super.key,
    required this.homeListing,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          screens.singlePropertyScreen,
          arguments: {"cubit": HomeLandingCubit.get(context), "id": id},
        );
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350.w, minWidth: 220.w),
        child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 0),
          width: 260.w,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
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
            children: [
              homeListing.images == null
                  ? Image.asset(
                    'assets/imgs/Union.png',
                    height: 130.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                  : CachedNetworkImage(
                    imageUrl: '${ApiConstants.homeImages}${homeListing.images}',
                    height: 130.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: backgroundClr,
                  ),
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 6,
                    top: 6,
                    bottom: 6,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.topLeft
                                : Alignment.topRight,
                        child: Text(
                          maxLines: 2,
                          homeListing.title,
                          style: getStyleBold13(
                            context,
                          ).copyWith(fontSize: 14.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/imgs/properties_icons/location.png',
                                height: 20.h,
                                width: 12.w,
                              ),
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  homeListing.location.name,
                                  style: getStyleBold13(
                                    context,
                                  ).copyWith(color: textSecondaryClr),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                        child: Text(
                          homeListing.price,
                          style: getStyleBold13(context),
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                        child: Favourite(isLiked: homeListing.isFavourite),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/badge_on_image.dart';
import '../../../../../core/widgets/favourite.dart';

class PropertyItem extends StatelessWidget {
  final Properties properties;
  const PropertyItem({super.key, required this.properties});
  @override
  Widget build(BuildContext context) {
    final cubit = PropertiesCubit.get(context);
    return Container(
      constraints: BoxConstraints(minHeight: 135.h, maxHeight: 230.h),
      margin: const EdgeInsets.only(left: 16, top: 7, bottom: 7, right: 16),
      padding: const EdgeInsets.only(left: 2, top: 3, bottom: 2),
      height: 220.h,
      clipBehavior: Clip.hardEdge,
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
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            width: 146.w,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child:
                      properties.images == null
                          ? Image.asset(
                            'assets/imgs/free.jpg',
                            height: double.infinity,
                            width: 146.w,
                            fit: BoxFit.cover,
                          )
                          : CachedNetworkImage(
                            imageUrl:
                                '${ApiConstants.homeImages}${properties.images}',
                            height: double.infinity,
                            width: 146.w,
                            fit: BoxFit.cover,
                          ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Favourite(isLiked: properties.isFavourite!),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BadgeOnImage(price: properties.type!),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      properties.title!,
                      style: getStyleBold13(context).copyWith(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/imgs/properties_icons/green_location.png',
                        height: 14.h,
                        width: 14.w,
                      ),
                      Flexible(
                        child: Text(
                          properties.location!.name!,
                          style: getStyleBold13(
                            context,
                          ).copyWith(color: textSecondaryClr),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Image.asset(
                        'assets/imgs/properties_icons/green_area.png',
                        height: 14.h,
                        width: 14.w,
                      ),
                      Expanded(
                        child: Text(
                          properties.area!,
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
                      Image.asset(
                        'assets/imgs/properties_icons/apartment.png',
                        height: 14.h,
                        width: 14.w,
                      ),
                      Flexible(
                        child: Text(
                          properties.apartment!.name!,
                          style: getStyleBold13(
                            context,
                          ).copyWith(color: textSecondaryClr),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/imgs/properties_icons/green_dollar.png',
                        height: 14.h,
                        width: 14.w,
                      ),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 120),
                        width: 85.w,
                        child: Text(
                          properties.price!,
                          style: getStyleBold13(
                            context,
                          ).copyWith(color: textSecondaryClr),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, singlePropertyScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryClr,
                            foregroundColor: Colors.white,
                            minimumSize: Size(60.w, 22.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            LangKeys.view,
                            style: getStyle10(
                              context,
                            ).copyWith(fontSize: 10.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';

class FeaturedRequestItem extends StatelessWidget {
  const FeaturedRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screens.singleRequestScreen);
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
            children: [
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
                            'Request for Residential Apartment in New Cairo',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getStyleBold13(
                              context,
                            ).copyWith(fontSize: 15),
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
                              height: 14.h,
                              width: 10.w,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 120.w),
                              child: SizedBox(
                                width: 100.w,
                                child: Text(
                                  ' New Cairo',
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
                              height: 14.h,
                              width: 10.w,
                            ),
                            Flexible(
                              child: Text(
                                ' 1.500.000 : 2.000.000',
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
                              height: 14.h,
                              width: 10.w,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 120.w),
                              child: SizedBox(
                                width: 100.w,
                                child: Text(
                                  ' Fully Finished',
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
                              height: 14.h,
                              width: 10.w,
                            ),
                            Flexible(
                              child: Text(
                                '  180 m',
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
              const Row(children: [Spacer(), Favourite(isLiked: false)]),
            ],
          ),
        ),
      ),
    );
  }
}

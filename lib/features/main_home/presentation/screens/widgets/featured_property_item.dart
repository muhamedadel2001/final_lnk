import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/logic/intl_logic.dart';
import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';

class FeaturedPropertyItem extends StatelessWidget {
  const FeaturedPropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, screens.singlePropertyScreen);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350, minWidth: 220),
        child: Container(
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 0),
          width: RespCalc().widthRatio(260),
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
              Image.asset(
                'assets/imgs/Union.png',
                height: RespCalc().heightRatio(130),
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
                          'Classic Apartment sale',
                          style: getStyleBold13(context).copyWith(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/imgs/properties_icons/location.png',
                                height: RespCalc().minRation(14),
                                width: RespCalc().minRation(6),
                              ),
                              Flexible(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  ' Smouha',
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
                          '85.000.000 EG',
                          style: getStyleBold13(context),
                        ),
                      ),
                      Align(
                        alignment:
                            context.locale.languageCode == 'en'
                                ? Alignment.bottomRight
                                : Alignment.bottomLeft,
                        child: const Favourite(isLiked: true),
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

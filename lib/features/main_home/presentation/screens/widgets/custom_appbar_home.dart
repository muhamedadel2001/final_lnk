import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../../core/util/colors.dart';

class CustomAppbarHome extends StatelessWidget {
  final UserData userData;
  const CustomAppbarHome({
    super.key,
    required this.userName,
    required this.userData,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LangKeys.hello, style: getStyle16(context)),
            Text(userName, style: getStyleBold16(context)),
          ],
        ),
        const Spacer(),
        userData.image == null
            ? GestureDetector(
              onTap: () {
                HomeLandingCubit.get(context).onTransition(3);
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/imgs/user_circle.png',
                    width: 35.w,
                    height: 35.h,
                  ),
                ],
              ),
            )
            : GestureDetector(
              onTap: () {
                HomeLandingCubit.get(context).onTransition(3);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.w,
                  imageUrl: "${ApiConstants.userUrlImages}${userData.image}",
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, color: Colors.redAccent),
                ),
              ),
            ),
      ],
    );
  }
}

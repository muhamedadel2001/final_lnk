import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';

class RequestBottomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RequestBottomSliverAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
      child: Row(
        children: [
          cubit.requestModel!.request.userId.image == null ||
                  cubit.requestModel!.request.userId.image == ""
              ? ClipRRect(
                child: Image.asset(
                  'assets/imgs/user_circle.png',
                  width: 45.w,
                  height: 45.w,
                  fit: BoxFit.cover,
                ),
              )
              : ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: CachedNetworkImage(
                  width: 45.w,
                  height: 45.w,
                  fit: BoxFit.cover,
                  imageUrl:
                      "${ApiConstants.userUrlImages}${cubit.requestModel!.request.userId.image}",
                ),
              ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.requestModel!.request.userId.name!,
                  style: getStyleBold16(context),
                ),
                Text(
                  cubit.requestModel!.title,
                  style: getStyleBold13(
                    context,
                  ).copyWith(color: textSecondaryClr, fontSize: 11.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40); // AppBar height
}

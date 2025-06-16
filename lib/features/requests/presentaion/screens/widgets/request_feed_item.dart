import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';
import 'my_request_item.dart';

class RequestFeedItem extends StatelessWidget {
  final Requests requests;
  final void Function()? onTap;
  const RequestFeedItem({super.key, required this.requests, this.onTap});

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
              Favourite(isLiked: requests.isFavourite!),
            ],
          ),
          MyRequestItem(requests: requests, onTap: onTap),
        ],
      ),
    );
  }
}

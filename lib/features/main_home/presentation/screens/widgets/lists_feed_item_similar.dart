import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/my_list_item_similar.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/my_request_item_similar.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';

class ListFeedItemSimilar extends StatelessWidget {
  final SimilarList lists;
  final void Function()? onTap;
  const ListFeedItemSimilar({super.key, required this.lists, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              lists.userId.image == null && lists.agencyId.image == null
                  ? Row(
                    children: [
                      Image.asset(
                        'assets/imgs/user_circle.png',
                        width: 40.w,
                        height: 40.w,
                      ),
                    ],
                  )
                  : lists.userId.image == null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${lists.agencyId.image}",
                    ),
                  )
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 40.w,
                      height: 40.w,
                      imageUrl:
                          "${ApiConstants.userUrlImages}${lists.userId.image}",
                    ),
                  ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      lists.userId.name!,
                      style: getStyleBold13(context),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      lists.titleOfuser,
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr, fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
              //  Favourite(isLiked: requests.isFavourite!),
            ],
          ),
          MyListItemSimilar(lists: lists, onTap: onTap),
        ],
      ),
    );
  }
}

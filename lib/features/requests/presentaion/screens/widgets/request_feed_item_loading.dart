import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/requests/data/models/requests_model.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/my_request_item_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/favourite.dart';
import 'my_request_item.dart';

class RequestFeedItemLoading extends StatelessWidget {
  const RequestFeedItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/imgs/user_circle.png',
                    width: 40.w,
                    height: 40.w,
                  ),
                ],
              ),

              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Adam',
                      style: getStyleBold13(context),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'requests.title!',
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr, fontSize: 11.5),
                    ),
                  ],
                ),
              ),
              Favourite(isLiked: false),
            ],
          ),
          MyRequestItemLoading(),
        ],
      ),
    );
  }
}

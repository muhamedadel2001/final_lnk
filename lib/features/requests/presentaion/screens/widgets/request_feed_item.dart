import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';
import 'my_request_item.dart';

class RequestFeedItem extends StatelessWidget {
  const RequestFeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                minRadius: 30,
                backgroundImage: AssetImage('assets/imgs/profile_image.png'),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Adam mohamed',
                      style: getStyleBold13(context),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Agent at raya aganecy',
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr, fontSize: 11.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const MyRequestItem(),
        ],
      ),
    );
  }
}

import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/reques_feed_item_similar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/screens.dart';
import '../../../../requests/presentaion/screens/widgets/request_feed_item.dart';

class SimilarityRequests extends StatelessWidget {
  const SimilarityRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    return SizedBox(
      height: 250.h, // أو حسب تصميم العنصر الداخلي
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 310.w,
            height: 250.h,
            child: RequestFeedItemSimilar(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  singleRequestScreen,
                  arguments: {
                    'id': cubit.listsModel!.similarRequests[index].id,
                    'cubit': HomeLandingCubit.get(context),
                  },
                );
              },
              requests: cubit.listsModel!.similarRequests[index],
            ),
          );
        },
        itemCount: cubit.listsModel!.similarRequests.length,
      ),
    );
  }
}

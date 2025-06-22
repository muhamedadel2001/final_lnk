import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/lists_feed_item_similar.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/reques_feed_item_similar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/util/screens.dart';

class SimilarityLists extends StatelessWidget {
  const SimilarityLists({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LangKeys.requestSimilar, style: getStyle20(context)),
        SizedBox(height: 25.h),
        SizedBox(
          height: 250.h, // أو حسب تصميم العنصر الداخلي
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 310.w,
                height: 250.h,
                child: ListFeedItemSimilar(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      singlePropertyScreen,
                      arguments: {
                        'id': cubit.requestModel!.similarLists[index].id,
                        'cubit': HomeLandingCubit.get(context),
                      },
                    );
                  },
                  lists: cubit.requestModel!.similarLists[index],
                ),
              );
            },
            itemCount: cubit.requestModel!.similarLists.length,
          ),
        ),
      ],
    );
  }
}

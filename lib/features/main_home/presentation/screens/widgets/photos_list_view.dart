import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/photo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';

class PhotosListView extends StatelessWidget {
  const PhotosListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return PhotoListItem(
            width: 70.w,
            imageUrl: cubit.listsModel!.list.images[index],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: cubit.listsModel!.list.images.length,
      ),
    );
  }
}

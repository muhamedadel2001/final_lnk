import 'package:final_lnk/features/main_home/presentation/screens/widgets/photo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/resp_calc.dart';

class PhotosListView extends StatelessWidget {
  const PhotosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const PhotoListItem(
            width: 75,
            imageUrl: 'assets/imgs/Union (2).png',
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 4,
      ),
    );
  }
}

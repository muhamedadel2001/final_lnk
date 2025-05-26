import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/photo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:photo_view/photo_view.dart';

import '../../../../../core/logic/resp_calc.dart';
import '../../../../../core/util/colors.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo gallery', style: getStyle20(context)),
        centerTitle: true,
        backgroundColor: accentClr,
      ),
      body: Column(
        children: [
          SizedBox(height: 131.h),
          SizedBox(
            width: double.infinity,
            height: 365.h,
            child: PhotoView(
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              imageProvider: const AssetImage('assets/imgs/free.jpg'),
            ),
          ),
          const Spacer(),
          Container(
            color: const Color(0xABF2E8D9),
            height: 85.h,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const PhotoListItem(
                  width: 75,
                  imageUrl: 'assets/imgs/Union (2).png',
                );
              },
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../home_landing/presentation/manager/home_landing_cubit.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  late List<String> images;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final cubit = HomeLandingCubit.get(context);
    images = cubit.listsModel!.list.images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangKeys.gallery, style: getStyle20(context)),
        centerTitle: true,
        backgroundColor: primaryClr,
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            width: double.infinity,
            height: 380.h,
            child: CachedNetworkImage(
              imageUrl: "${ApiConstants.homeImages}${images[selectedIndex]}",
              fit: BoxFit.contain,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) => const Icon(Icons.error_outline),
            ),
          ),
          const Spacer(),
          Container(
            color: primaryClr,
            height: 85.h,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final imageUrl = "${ApiConstants.homeImages}${images[index]}";
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            selectedIndex == index
                                ? Border.all(color: accentClr, width: 2)
                                : null,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 75.w,
                        height: 75.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

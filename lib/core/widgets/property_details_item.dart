import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/fonts.dart';

class PropertyDetailsItem extends StatelessWidget {
  const PropertyDetailsItem({
    super.key,
    required this.imageUrl,
    required this.nom,
    required this.title,
  });
  final String imageUrl;
  final int nom;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 35, bottom: 14, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 20, height: 20, child: Image.asset(imageUrl)),
              Text(' $nom', style: getStyle20(context)),
            ],
          ),
          Text(title, style: getStyle16(context).copyWith(fontSize: 14.sp)),
        ],
      ),
    );
  }
}

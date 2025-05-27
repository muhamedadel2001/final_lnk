import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/search_bar.dart';

class BottomSliverBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomSliverBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, left: 12.w, right: 16.w),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchbar(
              controller: TextEditingController(),
              onChange: (val) {},
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/imgs/filter.png',
              width: 31.w,
              height: 31.h,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40); // AppBar height
}

import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_bar.dart';

class BottomSliverBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onPressed;
  const BottomSliverBar({super.key, required this.onPressed});
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
            onPressed: onPressed,
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

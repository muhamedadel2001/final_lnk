import 'package:final_lnk/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSliverBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onPressed;
  final TextEditingController controller;
  final Function(String) onChange;

  const BottomSliverBar({
    super.key,
    required this.onPressed,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, left: 12.w, right: 16.w),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchbar(controller: controller, onChange: onChange),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}

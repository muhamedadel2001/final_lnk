import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

class AppBarWithDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            automaticallyImplyLeading: true,
            centerTitle: true, // Center the title
            title: Text(title, style: getStyle20(context)),
          ),
          const Divider(thickness: 1, height: 1, color: Color(0xff5A5A5A)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1 + 20); // AppBar height + Divider + top Padding
}

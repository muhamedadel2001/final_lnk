import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/lang_keys.dart';

class CustomFavouriteTabBar extends StatefulWidget {
  final TabController tabController;
  const CustomFavouriteTabBar({super.key, required this.tabController});

  @override
  State<CustomFavouriteTabBar> createState() => _CustomFavouriteTabBarState();
}

class _CustomFavouriteTabBarState extends State<CustomFavouriteTabBar>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        color: primaryClr,
        borderRadius: BorderRadius.circular(25),
      ),
      unselectedLabelStyle: getStyleBold13(context).copyWith(color: primaryClr),
      labelStyle: getStyleBold13(context).copyWith(color: accentClr2),
      splashBorderRadius: BorderRadius.circular(25),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      indicatorPadding: EdgeInsets.zero,
      dividerHeight: 0,
      splashFactory: NoSplash.splashFactory,
      controller: widget.tabController,
      onTap: (idx) {
        setState(() {});
      },
      tabs: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget.tabController.index == 0
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
          child: Text(LangKeys.posts),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget.tabController.index == 1
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
          child: Text(LangKeys.requests),
        ),
      ],
    );
  }
}

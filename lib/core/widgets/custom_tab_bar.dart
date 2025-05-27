import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget.tabController.index == 0
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
          ),
          child: Text('All'),
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
          child: Text('Residential'),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget.tabController.index == 2
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
          child: Text('Commercial'),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:
                widget.tabController.index == 3
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 9),
          child: Text('Coastal'),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_sliver_app_bar.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/intl_logic.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/widgets/custom_tab_bar.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        // التاب فعلاً اتغير وخلص الحركة

        print('Tab index changed to ${tabController.index}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: 'Available Lists',
            subTitle: 'Browse the Best Deals in the Market',
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(child: CustomTabBar(tabController: tabController)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: context.locale.languageCode == 'en' ? 18 : 0,
                right: context.locale.languageCode == 'en' ? 0 : 18,
              ),
              child: Text(
                '150 Property',
                style: getStyleBold13(
                  context,
                ).copyWith(color: textSecondaryClr),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          if (tabController.index == 0)
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return PropertyItem(tagged: "$index");
              }, childCount: 10),
            )
          else
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text("No data for this tab"),
                ),
              ),
            ),
          SliverToBoxAdapter(child: SizedBox(height: 25.h)),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/custom_sliver_app_bar.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/screens.dart';
import '../../../../core/widgets/custom_tab_bar.dart';
import '../manager/properties_cubit.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    final cubit = PropertiesCubit.get(context);
    cubit.getPropertiesData(
      lang: MyCache.getString(key: MyCacheKeys.language),
      context: context,
      query: '',
      type: getTypeByIndex(0),
    );
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        final type = getTypeByIndex(tabController.index);
        cubit.changeTabIndex(tabController.index);
        cubit.getPropertiesData(
          lang: MyCache.getString(key: MyCacheKeys.language),
          context: context,
          query: '',
          type: type,
        );
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !cubit.isLoadingMore &&
          cubit.hasMoreData) {
        final type = getTypeByIndex(tabController.index);
        cubit.getPropertiesData(
          lang: MyCache.getString(key: MyCacheKeys.language),
          context: context,
          query: '',
          type: type,
          isPagination: true,
        );
      }
    });
  }

  String getTypeByIndex(int index) {
    switch (index) {
      case 0:
        return "All";
      case 1:
        return "Residential";
      case 2:
        return "Commercial";
      case 3:
        return "Coastal";
      default:
        return "All";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = PropertiesCubit.get(context);
    return BlocBuilder<PropertiesCubit, PropertiesState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              CustomSliverAppBar(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    filterProprtiesScreen,
                    arguments: cubit,
                  );
                },
                title: 'Available Lists',
                subTitle: 'Browse the Best Deals in the Market',
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverToBoxAdapter(
                child: CustomTabBar(tabController: tabController),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: context.locale.languageCode == 'en' ? 18 : 0,
                    right: context.locale.languageCode == 'en' ? 0 : 18,
                  ),
                  child: Text(
                    state is GetPropertiesSuccess
                        ? state.propertiesModel.count.toString()
                        : '',
                    style: getStyleBold13(
                      context,
                    ).copyWith(color: textSecondaryClr),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index < cubit.myPropertiesList.length) {
                      return PropertyItem(
                        properties: cubit.myPropertiesList[index],
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child:
                              Platform.isAndroid
                                  ? CircularProgressIndicator(color: primaryClr)
                                  : CupertinoActivityIndicator(
                                    color: primaryClr,
                                  ),
                        ),
                      );
                    }
                  },
                  childCount:
                      cubit.isLoadingMore
                          ? cubit.myPropertiesList.length + 1
                          : cubit.myPropertiesList.length,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 25.h)),
            ],
          ),
        );
      },
    );
  }
}

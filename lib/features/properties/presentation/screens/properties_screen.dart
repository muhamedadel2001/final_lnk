import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/custom_sliver_app_bar.dart';
import 'package:final_lnk/core/widgets/global_empty_data.dart';
import 'package:final_lnk/core/widgets/global_error_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/util/screens.dart';
import '../../../../core/widgets/custom_tab_bar.dart';
import '../../../home_landing/presentation/manager/home_landing_cubit.dart';
import '../manager/properties_cubit.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late TabController tabController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

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
        _searchController.clear();
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
        if (_searchController.text.isNotEmpty) {
          cubit.getPropertiesData(
            lang: MyCache.getString(key: MyCacheKeys.language),
            context: context,
            query: _searchController.text,
            type: type,
            isPagination: true,
          );
        } else {
          cubit.getPropertiesData(
            lang: MyCache.getString(key: MyCacheKeys.language),
            context: context,
            query: '',
            type: type,
            isPagination: true,
          );
        }
      }
    });
  }

  void onSearchChanged(String val) {
    final cubit = PropertiesCubit.get(context);

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      cubit.getPropertiesData(
        lang: MyCache.getString(key: MyCacheKeys.language),
        context: context,
        query: val,
        type: getTypeByIndex(tabController.index),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final landingCubit = BlocProvider.of<HomeLandingCubit>(context);
    landingCubit.stream.listen((state) {
      if (state is ScreenChanged && landingCubit.index != 1) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
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
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                CustomSliverAppBar(
                  controller: _searchController,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      filterProprtiesScreen,
                      arguments: cubit,
                    );
                  },
                  title: 'Available Lists',
                  subTitle: 'Browse the Best Deals in the Market',
                  onChange: onSearchChanged,
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
                          ? "${state.propertiesModel.count.toString()} ${LangKeys.items}"
                          : '',
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                state is GetPropertiesSuccess &&
                            cubit.myPropertiesList.isNotEmpty ||
                        state is LoadedMoreState &&
                            cubit.myPropertiesList.isNotEmpty ||
                        state is LoadingMoreState &&
                            cubit.myPropertiesList.isNotEmpty ||
                        state is GetPropertiesLoading
                    ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          if (state is GetPropertiesSuccess ||
                              state is LoadedMoreState ||
                              state is LoadingMoreState) {
                            // عدد العناصر الحقيقية أو زائد واحد لو بيحمل المزيد
                            final isLoadingMoreItem =
                                cubit.isLoadingMore &&
                                index == cubit.myPropertiesList.length;

                            if (!isLoadingMoreItem &&
                                index < cubit.myPropertiesList.length) {
                              return PropertyItem(
                                properties: cubit.myPropertiesList[index],
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Center(
                                  child:
                                      Platform.isAndroid
                                          ? CircularProgressIndicator(
                                            color: primaryClr,
                                          )
                                          : CupertinoActivityIndicator(
                                            color: primaryClr,
                                          ),
                                ),
                              );
                            }
                          } else {
                            print('kk');
                            return Skeletonizer(
                              enabled: true,
                              child: PropertyItemLoading(),
                            );
                          }
                        },
                        childCount:
                            state is GetPropertiesSuccess ||
                                    state is LoadedMoreState ||
                                    state is LoadingMoreState
                                ? cubit.isLoadingMore
                                    ? cubit.myPropertiesList.length + 1
                                    : cubit.myPropertiesList.length
                                : 3, // عدد العناصر الوهمية أثناء التحميل الأولي
                      ),
                    )
                    : state is GetPropertiesSuccess &&
                        cubit.myPropertiesList.isEmpty
                    ? SliverToBoxAdapter(
                      child: GlobalEmptyWidget(
                        imagePath: 'assets/imgs/empty.png',
                        message: LangKeys.noResult,
                      ),
                    )
                    : SliverToBoxAdapter(
                      child: GlobalErrorWidget(
                        imagePath: 'assets/imgs/user.png',
                      ),
                    ),

                SliverToBoxAdapter(child: SizedBox(height: 25.h)),
              ],
            ),
          ),
        );
      },
    );
  }
}

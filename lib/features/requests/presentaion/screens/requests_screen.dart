import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/custom_sliver_app_bar.dart';
import 'package:final_lnk/core/widgets/global_empty_data.dart';
import 'package:final_lnk/core/widgets/global_error_widget.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/request_feed_item.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/request_feed_item_loading.dart';
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

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});
  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late TabController tabController;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final cubit = RequestsCubit.get(context);
    cubit.getRequestsData(
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
        cubit.getRequestsData(
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
          !cubit.isLoadingMoreRequests &&
          cubit.hasMoreDataRequests) {
        final type = getTypeByIndex(tabController.index);
        if (_searchController.text.isNotEmpty) {
          cubit.getRequestsData(
            lang: MyCache.getString(key: MyCacheKeys.language),
            context: context,
            query: _searchController.text,
            type: type,
            isPagination: true,
          );
        } else {
          cubit.getRequestsData(
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
    final cubit = RequestsCubit.get(context);

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      _scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeIn,
      );

      cubit.getRequestsData(
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
      if (state is ScreenChanged && landingCubit.index != 2) {
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
    final cubit = RequestsCubit.get(context);
    return BlocBuilder<RequestsCubit, RequestsState>(
      buildWhen: (prev, curr) {
        return curr is GetRequestsSuccess ||
            curr is GetRequestsLoading ||
            curr is GetInputsRequestsFailure ||
            curr is LoadingMoreState ||
            curr is AddedToFavSuccess ||
            curr is Updated ||
            curr is LoadedMoreState;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
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
                      filterRequestsScreen,
                      arguments: {
                        'requestsCubit': cubit,
                        'homeLandingCubit': HomeLandingCubit.get(context),
                      },
                    );
                  },
                  title: LangKeys.propertiesRequested,
                  subTitle: LangKeys.browseDeals,
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
                      state is GetRequestsSuccess
                          ? "${state.requestsModel.count.toString()} ${LangKeys.items}"
                          : '',
                      style: getStyleBold13(
                        context,
                      ).copyWith(color: textSecondaryClr),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                state is GetRequestsSuccess &&
                            cubit.myRequestsList.isNotEmpty ||
                        state is LoadedMoreState &&
                            cubit.myRequestsList.isNotEmpty ||
                        state is LoadingMoreState &&
                            cubit.myRequestsList.isNotEmpty ||
                        state is GetRequestsLoading ||
                        state is AddedToFavSuccess ||
                        state is Updated
                    ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          if (state is GetRequestsSuccess ||
                              state is LoadedMoreState ||
                              state is LoadingMoreState ||
                              state is Updated ||
                              state is AddedToFavSuccess) {
                            // عدد العناصر الحقيقية أو زائد واحد لو بيحمل المزيد
                            final isLoadingMoreItem =
                                cubit.isLoadingMoreRequests &&
                                index == cubit.myRequestsList.length;

                            if (!isLoadingMoreItem &&
                                index < cubit.myRequestsList.length) {
                              return RequestFeedItem(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    singleRequestScreen,
                                    arguments: {
                                      'id': cubit.myRequestsList[index].sId,
                                      'cubit': HomeLandingCubit.get(context),
                                      "fromProfile": false,
                                    },
                                  );
                                },
                                requests: cubit.myRequestsList[index],
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
                            return Skeletonizer(
                              enabled: true,
                              child: RequestFeedItemLoading(),
                            );
                          }
                        },
                        childCount:
                            state is GetRequestsSuccess ||
                                    state is LoadedMoreState ||
                                    state is LoadingMoreState ||
                                    state is Updated ||
                                    state is AddedToFavSuccess
                                ? cubit.isLoadingMoreRequests
                                    ? cubit.myRequestsList.length + 1
                                    : cubit.myRequestsList.length
                                : 3, // عدد العناصر الوهمية أثناء التحميل الأولي
                      ),
                    )
                    : state is GetRequestsSuccess &&
                            cubit.myRequestsList.isEmpty ||
                        state is LoadedMoreState &&
                            cubit.myRequestsList.isEmpty ||
                        state is LoadingMoreState &&
                            cubit.myRequestsList.isEmpty
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

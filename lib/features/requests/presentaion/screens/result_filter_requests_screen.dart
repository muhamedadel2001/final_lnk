import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/widgets/global_empty_data.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_sliver_app_bar_result_filter.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/request_feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/util/screens.dart';
import '../../../home_landing/presentation/manager/home_landing_cubit.dart';

class ResultFilterRequestsScreen extends StatefulWidget {
  final String? minArea;
  final String? maxArea;
  final String? minPrice;
  final String? maxPrice;
  const ResultFilterRequestsScreen({
    super.key,
    this.minArea,
    this.maxArea,
    this.minPrice,
    this.maxPrice,
  });
  @override
  State<ResultFilterRequestsScreen> createState() =>
      _ResultFilterRequestsScreenState();
}

class _ResultFilterRequestsScreenState
    extends State<ResultFilterRequestsScreen> {
  late ScrollController _scrollController;
  late RequestsCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<RequestsCubit>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !cubit.isLoadingMorePRequestsFilter &&
          cubit.hasMoreDataRequestsFilter) {
        RequestsCubit.get(context).getRequestsFilterData(
          type: RequestsCubit.get(context).propertyStatus,
          typeOfRequest: RequestsCubit.get(context).propertyCategory,
          lang: MyCache.getString(key: MyCacheKeys.language),
          typeOfRent: RequestsCubit.get(context).userSelection.typeOfRentId,
          minArea: widget.minArea,
          maxArea: widget.maxArea,
          minPrice: widget.minPrice,
          maxPrice: widget.maxPrice,
          city: RequestsCubit.get(context).userSelection.cityId,
          location: RequestsCubit.get(context).userSelection.areaId,
          finishing: RequestsCubit.get(context).userSelection.finishingId,
          isPagination: true,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBarResultFilter(title: LangKeys.searchResults),
          BlocBuilder<RequestsCubit, RequestsState>(
            builder: (context, state) {
              return state is GetRequestsFilterDataSuccess &&
                      RequestsCubit.get(context).myRequestsListFilter.isEmpty
                  ? SliverToBoxAdapter(
                    child: GlobalEmptyWidget(
                      imagePath: 'assets/imgs/empty.png',
                      message: LangKeys.noResult,
                    ),
                  )
                  : SliverList(
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      return RequestFeedItem(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            singleRequestScreen,
                            arguments: {
                              'id': cubit.myRequestsListFilter[index].sId,
                              'cubit': HomeLandingCubit.get(context),
                              "fromProfile": false,
                            },
                          );
                        },
                        requests: cubit.myRequestsListFilter[index],
                      );
                    }, childCount: cubit.myRequestsListFilter.length),
                  );
            },
          ),
        ],
      ),
    );
  }
}

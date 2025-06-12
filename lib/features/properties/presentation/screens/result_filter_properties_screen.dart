import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/widgets/global_empty_data.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_sliver_app_bar_result_filter.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/util/screens.dart';
import '../../../home_landing/presentation/manager/home_landing_cubit.dart';

class ResultFilterPropertiesScreen extends StatefulWidget {
  final String? minArea;
  final String? maxArea;
  final String? minPrice;
  final String? maxPrice;
  const ResultFilterPropertiesScreen({
    super.key,
    this.minArea,
    this.maxArea,
    this.minPrice,
    this.maxPrice,
  });
  @override
  State<ResultFilterPropertiesScreen> createState() =>
      _ResultFilterPropertiesScreenState();
}

class _ResultFilterPropertiesScreenState
    extends State<ResultFilterPropertiesScreen> {
  late ScrollController _scrollController;
  late PropertiesCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<PropertiesCubit>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !cubit.isLoadingMorePropertiesFilter &&
          cubit.hasMoreDataPropertiesFilter) {
        PropertiesCubit.get(context).getPropertiesFilterData(
          type: PropertiesCubit.get(context).propertyStatus,
          typeOfList: PropertiesCubit.get(context).propertyCategory,
          lang: MyCache.getString(key: MyCacheKeys.language),
          typeOfRent: PropertiesCubit.get(context).userSelection.typeOfRentId,
          minArea: widget.minArea,
          maxArea: widget.maxArea,
          minPrice: widget.minPrice,
          maxPrice: widget.maxPrice,
          city: PropertiesCubit.get(context).userSelection.cityId,
          location: PropertiesCubit.get(context).userSelection.areaId,
          finishing: PropertiesCubit.get(context).userSelection.finishingId,
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
          CustomSliverAppBarResultFilter(title: 'Search result'),
          BlocBuilder<PropertiesCubit, PropertiesState>(
            builder: (context, state) {
              return state is GetPropertiesFilterDataSuccess &&
                      PropertiesCubit.get(
                        context,
                      ).myPropertiesListFilter.isEmpty
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
                      return PropertyItem(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            singlePropertyScreen,
                            arguments: {
                              'id': cubit.myPropertiesListFilter[index].sId,
                              'cubit': HomeLandingCubit.get(context),
                            },
                          );
                        },
                        properties: cubit.myPropertiesListFilter[index],
                      );
                    }, childCount: cubit.myPropertiesListFilter.length),
                  );
            },
          ),
        ],
      ),
    );
  }
}

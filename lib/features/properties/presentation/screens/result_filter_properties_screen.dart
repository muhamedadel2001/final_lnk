import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_item_result_filter.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/custom_sliver_app_bar_result_filter.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/property_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    );
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
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return PropertyItem(
                properties: cubit.myPropertiesListFilter[index],
              );
            }, childCount: cubit.myPropertiesListFilter.length),
          ),
        ],
      ),
    );
  }
}

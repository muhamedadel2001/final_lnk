import 'package:bloc/bloc.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/usecases/properties_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/const.dart';

part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  final PropertiesUseCases propertiesUseCases;
  PropertiesCubit(this.propertiesUseCases) : super(PropertiesInitial());
  static PropertiesCubit get(context) =>
      BlocProvider.of<PropertiesCubit>(context);
  String city = ourCities[0];
  String propertyCategory = 'residential';
  String propertyStatus = 'Sell';
  String? finishing;
  String? furnishing;
  TextEditingController price = TextEditingController();
  TextEditingController area = TextEditingController();
  List<Properties> myPropertiesList = [];
  int currentPage = 1;
  bool isLoadingMore = false;
  bool hasMoreData = true;

  Future<void> getPropertiesData({
    required String lang,
    required BuildContext context,
    required String query,
    required String type,
    bool isPagination = false,
  }) async {
    if (isPagination && (isLoadingMore || !hasMoreData)) return;
    if (!isPagination) {
      print('ne');
      emit(GetPropertiesLoading());
      myPropertiesList.clear();
      currentPage = 1;
      hasMoreData = true;
    } else {
      isLoadingMore = true;
      emit(LoadingMoreState());
    }

    final result = await propertiesUseCases.getPropertiesCall(
      page: currentPage,
      type: type,
      lang: lang,
      context: context,
      query: query,
    );

    result.fold(
      (failure) {
        if (isPagination) {
          isLoadingMore = false;
        } else {
          emit(GetPropertiesFailure());
        }
      },
      (success) {
        final newList = success.properties ?? [];
        if (newList.isEmpty) {
          hasMoreData = false;
        } else {
          myPropertiesList.addAll(newList);
          currentPage++;
        }

        if (isPagination) {
          isLoadingMore = false;
          emit(LoadedMoreState());
        } else {
          emit(GetPropertiesSuccess(propertiesModel: success));
        }
      },
    );
  }

  int currentTabIndex = 0;

  void changeTabIndex(int index) {
    currentTabIndex = index;
    emit(TabChanged()); // حالة بسيطة لإجبار الواجهة تعيد البناء
  }
}

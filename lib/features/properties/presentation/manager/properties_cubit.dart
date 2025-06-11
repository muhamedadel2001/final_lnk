import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/auth/data/models/areas_model.dart';
import 'package:final_lnk/features/auth/data/models/cities_model.dart';
import 'package:final_lnk/features/auth/data/models/finishing_model.dart';
import 'package:final_lnk/features/auth/data/models/type_of_rent_model.dart';
import 'package:final_lnk/features/properties/data/models/properties_model.dart';
import 'package:final_lnk/features/properties/domain/usecases/properties_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/logic/start_model.dart';
import '../../../../core/util/const.dart';
import '../../../auth/data/models/user_selection.dart';
part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  final PropertiesUseCases propertiesUseCases;
  final userSelection = UserSelection();
  final appModel = AllStartModel();
  PropertiesCubit(this.propertiesUseCases) : super(PropertiesInitial());
  static PropertiesCubit get(context) =>
      BlocProvider.of<PropertiesCubit>(context);
  String propertyCategory = LangKeys.residential;
  String propertyStatus = LangKeys.sale;
  String? finishing;
  List<Properties> myPropertiesList = [];
  List<Properties> myPropertiesListFilter = [];
  int currentPageProperties = 1;
  int currentPagePropertiesFilter = 1;
  bool isLoadingMoreProperties = false;
  bool isLoadingMorePropertiesFilter = false;
  bool hasMoreDataProperties = true;
  bool hasMoreDataPropertiesFilter = true;
  void changePropertyStatus(String status) {
    propertyStatus = status;
    emit(PropertyStatusChanged());
  }

  void changePropertyCategory(String category) {
    propertyCategory = category;
    emit(PropertyCategoryChanged());
  }

  Future<void> getPropertiesData({
    required String lang,
    required BuildContext context,
    required String query,
    required String type,
    bool isPagination = false,
  }) async {
    if (isPagination && (isLoadingMoreProperties || !hasMoreDataProperties))
      return;
    if (!isPagination) {
      emit(GetPropertiesLoading());
      myPropertiesList.clear();
      currentPageProperties = 1;
      hasMoreDataProperties = true;
    } else {
      isLoadingMoreProperties = true;
      emit(LoadingMoreState());
    }

    final result = await propertiesUseCases.getPropertiesCall(
      page: currentPageProperties,
      type: type,
      lang: lang,
      context: context,
      query: query,
    );

    result.fold(
      (failure) {
        if (isPagination) {
          isLoadingMoreProperties = false;
        } else {
          emit(GetPropertiesFailure());
        }
      },
      (success) {
        final newList = success.properties ?? [];
        if (newList.isEmpty) {
          hasMoreDataProperties = false;
        } else {
          myPropertiesList.addAll(newList);
          currentPageProperties++;
        }

        if (isPagination) {
          isLoadingMoreProperties = false;
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

  AreasModel? areasModel;
  TypeOfRentModel? typeOfRentModel;

  Future<void> getAllInputsPropertiesFilter({required String lang}) async {
    emit(GetInputsLoading());
    final results = await Future.wait([
      propertiesUseCases.getCitiesCall(lang: lang),
      propertiesUseCases.getFinishingTypeCall(lang: lang),
      propertiesUseCases.getTypeOfRentCall(lang: lang),
    ]);
    for (var result in results) {
      if (result is Left) {
        emit(GetInputsFailure());
        return;
      }
    }
    appModel.citiesModel = (results[0] as Right).value as CitiesModel;
    appModel.finishingModel = (results[1] as Right).value as FinishingModel;
    typeOfRentModel = (results[2] as Right).value as TypeOfRentModel;
    emit(GetInputsSuccess());
  }

  getAreas({required String lang, required String id}) async {
    final result = await propertiesUseCases.getAreasCall(
      lang: lang,
      id: userSelection.cityId!,
    );
    result.fold((failure) => {emit(GetInputsFailure())}, (success) {
      appModel.areasModel = success;
      emit(GetInputsSuccess());
    });
  }

  getPropertiesFilterData({
    String? lang,
    String? type,
    String? typeOfList,
    String? city,
    String? typeOfRent,
    String? location,
    String? finishing,
    String? minArea,
    String? maxArea,
    String? minPrice,
    String? maxPrice,
    bool isPagination = false,
  }) async {
    if (isPagination &&
        (isLoadingMorePropertiesFilter || !hasMoreDataPropertiesFilter))
      return;
    if (!isPagination) {
      emit(GetPropertiesFilterDataLoading());
      myPropertiesListFilter.clear();
      currentPagePropertiesFilter = 1;
      hasMoreDataPropertiesFilter = true;
    } else {
      isLoadingMorePropertiesFilter = true;
      emit(LoadingMoreState());
    }
    final result = await propertiesUseCases.getPropertiesFilterCall(
      page: currentPagePropertiesFilter,
      lang: lang,
      type: type,
      typeOfList: typeOfList,
      city: city,
      typeOfRent: typeOfRent,
      location: location,
      finishing: finishing,
      minArea: minArea,
      maxArea: maxArea,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
    result.fold(
      (failure) {
        if (isPagination) {
          isLoadingMorePropertiesFilter = false;
        } else {
          emit(GetPropertiesFilterDataFailure(message: failure.errMessage));
        }
      },
      (success) {
        print(success.properties!.length);
        final newList = success.properties ?? [];
        if (newList.isEmpty) {
          hasMoreDataPropertiesFilter = false;
        } else {
          myPropertiesListFilter.addAll(newList);
          currentPagePropertiesFilter++;
        }

        if (isPagination) {
          isLoadingMorePropertiesFilter = false;
          emit(LoadedMoreState());
        } else {
          emit(GetPropertiesFilterDataSuccess());
        }
      },
    );
  }

  changeValue() {
    emit(GetInputsSuccess());
  }
}

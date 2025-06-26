import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/requests/domain/usecases/properties_usecases.dart';
import 'package:flutter/cupertino.dart'
    show BuildContext, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/logic/start_model.dart';
import '../../../../core/util/const.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';
import '../../../auth/data/models/user_selection.dart';
import '../../data/models/requests_model.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this.requestsUseCases) : super(RequestsInitial());
  final RequestsUseCases requestsUseCases;
  static RequestsCubit get(context) => BlocProvider.of<RequestsCubit>(context);
  String propertyCategory = LangKeys.residential;
  String propertyStatus = LangKeys.sale;
  String? finishing;
  List<Requests> myRequestsList = [];
  List<Requests> myRequestsListFilter = [];
  int currentPageRequests = 1;
  int currentPageRequestsFilter = 1;
  bool isLoadingMoreRequests = false;
  bool isLoadingMorePRequestsFilter = false;
  bool hasMoreDataRequests = true;
  bool hasMoreDataRequestsFilter = true;
  final userSelection = UserSelection();
  final appModel = AllStartModel();
  void changePropertyStatus(String status) {
    propertyStatus = status;
    emit(PropertyStatusChanged());
  }

  void changePropertyCategory(String category) {
    propertyCategory = category;
    emit(PropertyCategoryChanged());
  }

  Future<void> getRequestsData({
    required String lang,
    required BuildContext context,
    required String query,
    required String type,
    bool isPagination = false,
  }) async {
    if (isPagination && (isLoadingMoreRequests || !hasMoreDataRequests)) {
      return;
    }
    if (!isPagination) {
      emit(GetRequestsLoading());
      myRequestsList.clear();
      currentPageRequests = 1;
      hasMoreDataRequests = true;
    } else {
      isLoadingMoreRequests = true;
      emit(LoadingMoreState());
    }

    final result = await requestsUseCases.getRequestsCall(
      page: currentPageRequests,
      type: type,
      lang: lang,
      context: context,
      query: query,
    );

    result.fold(
      (failure) {
        if (isPagination) {
          isLoadingMoreRequests = false;
        } else {
          emit(GetRequestsFailure());
        }
      },
      (success) {
        final newList = success.requests ?? [];
        if (newList.isEmpty) {
          hasMoreDataRequests = false;
        } else {
          myRequestsList.addAll(newList);
          currentPageRequests++;
        }

        if (isPagination) {
          isLoadingMoreRequests = false;
          emit(LoadedMoreState());
        } else {
          emit(GetRequestsSuccess(requestsModel: success));
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

  Future<void> getAllInputsRequestsFilter({required String lang}) async {
    emit(GetInputsRequestsLoading());
    final results = await Future.wait([
      requestsUseCases.getCitiesCall(lang: lang),
      requestsUseCases.getFinishingTypeCall(lang: lang),
      requestsUseCases.getTypeOfRentCall(lang: lang),
    ]);
    for (var result in results) {
      if (result is Left) {
        emit(GetInputsRequestsFailure());
        return;
      }
    }
    appModel.citiesModel = (results[0] as Right).value as CitiesModel;
    appModel.finishingModel = (results[1] as Right).value as FinishingModel;
    typeOfRentModel = (results[2] as Right).value as TypeOfRentModel;
    emit(GetInputsRequestsSuccess());
  }

  getAreas({required String lang, required String id}) async {
    final result = await requestsUseCases.getAreasCall(
      lang: lang,
      id: userSelection.cityId!,
    );
    result.fold((failure) => {emit(GetInputsRequestsFailure())}, (success) {
      appModel.areasModel = success;
      emit(GetInputsRequestsSuccess());
    });
  }

  getRequestsFilterData({
    String? lang,
    String? type,
    String? typeOfRequest,
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
        (isLoadingMorePRequestsFilter || !hasMoreDataRequestsFilter)) {
      return;
    }
    if (!isPagination) {
      emit(GetRequestsFilterDataLoading());
      myRequestsListFilter.clear();
      currentPageRequestsFilter = 1;
      hasMoreDataRequestsFilter = true;
    } else {
      isLoadingMorePRequestsFilter = true;
      emit(LoadingMoreState());
    }
    final result = await requestsUseCases.getRequestsFilterCall(
      page: currentPageRequestsFilter,
      lang: lang,
      type: type,
      typeOfRequest: typeOfRequest,
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
          isLoadingMorePRequestsFilter = false;
        } else {
          emit(GetRequestsFilterDataFailure(message: failure.errMessage));
        }
      },
      (success) {
        print(success.requests!.length);
        final newList = success.requests ?? [];
        if (newList.isEmpty) {
          hasMoreDataRequestsFilter = false;
        } else {
          myRequestsListFilter.addAll(newList);
          currentPageRequestsFilter++;
        }

        if (isPagination) {
          isLoadingMorePRequestsFilter = false;
          emit(LoadedMoreState());
        } else {
          emit(GetRequestsFilterDataSuccess());
        }
      },
    );
  }

  changeValue() {
    emit(GetInputsRequestsSuccess());
  }

  void toggleFavoriteLocally(String id) {
    final index = myRequestsList.indexWhere((item) => item.sId == id);
    if (index != -1) {
      final updatedItem = myRequestsList[index].copyWith(
        isFavourite: !(myRequestsList[index].isFavourite ?? false),
      );
      myRequestsList[index] = updatedItem;
    }

    // ✅ كمان لازم تحدث الـ list بتاعت الفلتر لو هي اللي ظاهرة
    final filterIndex = myRequestsListFilter.indexWhere(
      (item) => item.sId == id,
    );
    if (filterIndex != -1) {
      final updatedFilterItem = myRequestsListFilter[filterIndex].copyWith(
        isFavourite: !(myRequestsListFilter[filterIndex].isFavourite ?? false),
      );
      myRequestsListFilter[filterIndex] = updatedFilterItem;
    }
    emit(Updated());
  }
}

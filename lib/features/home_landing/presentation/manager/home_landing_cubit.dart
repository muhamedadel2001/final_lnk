import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:final_lnk/core/connection/network_info.dart';
import 'package:final_lnk/core/databases/api/dio_consumer.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/features/home_landing/data/models/apartments_model.dart';
import 'package:final_lnk/features/home_landing/data/models/furnishing_model.dart';
import 'package:final_lnk/features/home_landing/data/models/lists_model.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:final_lnk/features/home_landing/domain/usecases/responses_usecases.dart';
import 'package:final_lnk/features/main_home/data/datasources/user_local_data.dart';
import 'package:final_lnk/features/main_home/data/datasources/user_remote_data.dart';
import 'package:final_lnk/features/main_home/data/repositories/home_repo_impl.dart';
import 'package:final_lnk/features/main_home/domain/usecases/home_use_case.dart';
import 'package:final_lnk/features/main_home/presentation/manager/main_home_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/home_screen.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_local_data.dart';
import 'package:final_lnk/features/properties/data/datasources/properties_remote_data.dart';
import 'package:final_lnk/features/properties/data/repositories/properties_repo_impl.dart';
import 'package:final_lnk/features/properties/domain/usecases/properties_usecases.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/requests/data/datasources/requests_local_data.dart';
import 'package:final_lnk/features/requests/data/datasources/requests_remote_data.dart';
import 'package:final_lnk/features/requests/data/repositories/requests_repo_impl.dart';
import 'package:final_lnk/features/requests/domain/usecases/properties_usecases.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/logic/start_model.dart';
import '../../../../core/util/const.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/util/property_model.dart';
import '../../../auth/data/models/areas_model.dart';
import '../../../auth/data/models/cities_model.dart';
import '../../../auth/data/models/finishing_model.dart';
import '../../../auth/data/models/type_of_rent_model.dart';
import '../../../auth/data/models/user_selection.dart';
import '../../../properties/presentation/screens/properties_screen.dart';
import '../../../requests/presentaion/screens/requests_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

part 'home_landing_state.dart';

class HomeLandingCubit extends Cubit<HomeLandingState> {
  HomeLandingCubit(this.responsesUseCase) : super(HomeLandingInitial());

  static HomeLandingCubit get(context) =>
      BlocProvider.of<HomeLandingCubit>(context);

  int index = 0;
  List<Widget?> screens = [
    BlocProvider(
      create:
          (context) => MainHomeCubit(
            GetHomeUseCase(
              homeRepo: HomeRepoImpl(
                networkInfo: NetworkInfoImpl(DataConnectionChecker()),
                userRemoteData: UserRemoteData(
                  apiConsumer: DioConsumer(
                    dio: Dio(
                      BaseOptions(
                        connectTimeout: Duration(seconds: 60),
                        receiveTimeout: Duration(seconds: 60),
                      ),
                    ),
                  ),
                ),
                userLocalData: UserLocalData(),
              ),
            ),
          ),
      child: HomeScreen(),
    ),
    null,
    null,
    null,
  ];
  int cnt = 0;

  onTransition(int idx) {
    if (index != idx) {
      index = idx;
      if (screens[idx] == null) {
        screens[idx] = _getPage(idx);
      }
      emit(ScreenChanged());
    }
  }

  Widget _getPage(int idx) {
    if (idx == 0) {
      return BlocProvider(
        create:
            (context) => MainHomeCubit(
              GetHomeUseCase(
                homeRepo: HomeRepoImpl(
                  networkInfo: NetworkInfoImpl(DataConnectionChecker()),
                  userRemoteData: UserRemoteData(
                    apiConsumer: DioConsumer(
                      dio: Dio(
                        BaseOptions(
                          connectTimeout: Duration(seconds: 60),
                          receiveTimeout: Duration(seconds: 60),
                        ),
                      ),
                    ),
                  ),
                  userLocalData: UserLocalData(),
                ),
              ),
            ),
        child: HomeScreen(),
      );
    } else if (idx == 1) {
      return BlocProvider(
        create:
            (context) => PropertiesCubit(
              PropertiesUseCases(
                propertiesRepo: PropertiesRepoImpl(
                  networkInfo: NetworkInfoImpl(DataConnectionChecker()),
                  propertiesRemoteData: PropertiesRemoteData(
                    apiConsumer: DioConsumer(
                      dio: Dio(
                        BaseOptions(
                          connectTimeout: Duration(seconds: 10),
                          receiveTimeout: Duration(seconds: 10),
                        ),
                      ),
                    ),
                  ),
                  propertiesLocalData: PropertiesLocalData(),
                ),
              ),
            ),
        child: PropertiesScreen(),
      );
    } else if (idx == 2) {
      return BlocProvider(
        create:
            (context) => RequestsCubit(
              RequestsUseCases(
                requestsRepo: RequestsRepoImpl(
                  networkInfo: NetworkInfoImpl(DataConnectionChecker()),
                  requestsRemoteData: RequestsRemoteData(
                    apiConsumer: DioConsumer(
                      dio: Dio(
                        BaseOptions(
                          connectTimeout: Duration(seconds: 10),
                          receiveTimeout: Duration(seconds: 10),
                        ),
                      ),
                    ),
                  ),
                  requestsLocalData: RequestsLocalData(),
                ),
              ),
            ),
        child: RequestsScreen(),
      );
    } else {
      return BlocProvider(
        create: (context) => SettingsCubit(),
        child: SettingsScreen(),
      );
    }
  }

  List<ApartmentType> selectedPropertyTypesList = [];
  final ImagePicker _picker = ImagePicker();
  List<GlobalKey<FormState>> keys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final userSelection = UserSelection();
  final appModel = AllStartModel();
  String titleButton = '';
  String propertyCategory = LangKeys.residential;
  String propertyStatus = LangKeys.sale;
  String payment = LangKeys.cash;
  String propertyType = '';
  String? finishing;
  String? furnishing;
  String typeOfRent = 'Daily';
  bool isRequest = false;
  TextEditingController insurance = TextEditingController();
  TextEditingController propertyLocation = TextEditingController();
  TextEditingController areaByMeter = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController downPayment = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController whatsAppNumber = TextEditingController();
  List<XFile> imageFiles = [];
  List<String> additionalFeatures = [];

  void changePropertyStatus(String status) {
    propertyStatus = status;
    emit(PropertyStatusChanged());
  }

  void changePaymentMethod(String payment) {
    this.payment = payment;
    emit(PropertyPriceChanged());
  }

  void changePropertyCategory(String category) {
    propertyCategory = category;
    emit(PropertyCategoryChanged());
  }

  bool isShowingAllPropertyTypes = false;

  viewMoreOrLess() {
    if (selectedPropertyTypesList.length <= 6) {
      selectedPropertyTypesList =
          propertyCategory == LangKeys.commercial
              ? appModel.apartmentsModel!.commercialApartments
              : appModel.apartmentsModel!.residentialApartments;
    } else {
      selectedPropertyTypesList =
          propertyCategory == LangKeys.commercial
              ? appModel.apartmentsModel!.commercialApartments.sublist(0, 5)
              : appModel.apartmentsModel!.residentialApartments.sublist(0, 5);
    }
  }

  Future<void> pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        imageFiles.addAll(pickedFiles);
      }
    } catch (e) {
      print('error image');
    }
  }

  bool isDialOpen = false;

  void toggleDial() {
    isDialOpen = !isDialOpen;
    emit(ScreenChanged());
  }

  void closeDial() {
    if (isDialOpen) {
      isDialOpen = false;
      emit(ScreenChanged());
    }
  }

  final ResponsesUseCase responsesUseCase;
  ListsModel? listsModel;
  RequestModel? requestModel;
  getOneList({
    required String lang,
    required BuildContext context,
    required String id,
  }) async {
    emit(GetOneLoading());
    final result = await responsesUseCase.getOneListCall(
      lang: lang,
      context: context,
      id: id,
    );
    result.fold(
      (failure) {
        emit(GetOneFailure());
      },
      (success) {
        listsModel = success;
        emit(GetOneSuccess());
      },
    );
  }

  getOneRequest({
    required String lang,
    required BuildContext context,
    required String id,
  }) async {
    emit(GetOneLoading());
    final result = await responsesUseCase.getOneRequestCall(
      lang: lang,
      context: context,
      id: id,
    );
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(GetOneFailure());
      },
      (success) {
        requestModel = success;
        emit(GetOneSuccess());
      },
    );
  }

  AreasModel? areasModel;
  TypeOfRentModel? typeOfRentModel;

  Future<void> getAllInputsPropertiesFilter({required String lang}) async {
    emit(GetInputsLoadingCreate());
    final results = await Future.wait([
      responsesUseCase.getCitiesCall(lang: lang),
      responsesUseCase.getFinishingTypeCall(lang: lang),
      responsesUseCase.getTypeOfRentCall(lang: lang),
      responsesUseCase.getApartmentsCall(lang: lang),
      responsesUseCase.getFurnishingTypeCall(lang: lang),
    ]);
    for (var result in results) {
      if (result is Left) {
        emit(GetInputsFailureCreate());
        return;
      }
    }
    appModel.citiesModel = (results[0] as Right).value as CitiesModel;
    appModel.finishingModel = (results[1] as Right).value as FinishingModel;
    typeOfRentModel = (results[2] as Right).value as TypeOfRentModel;
    appModel.apartmentsModel = (results[3] as Right).value as ApartmentsModel;
    appModel.furnishingModel = (results[4] as Right).value as FurnishingModel;
    selectedPropertyTypesList =
        propertyCategory == LangKeys.commercial
            ? appModel.apartmentsModel!.commercialApartments.sublist(0, 5)
            : appModel.apartmentsModel!.residentialApartments.sublist(0, 5);
    propertyType = selectedPropertyTypesList[0].id;
    emit(GetInputsSuccessCreate());
  }

  getAreas({required String lang, required String id}) async {
    final result = await responsesUseCase.getAreasCall(
      lang: lang,
      id: userSelection.cityId!,
    );
    result.fold((failure) => {emit(GetInputsFailureCreate())}, (success) {
      appModel.areasModel = success;
      emit(GetInputsSuccessCreate());
    });
  }

  changeValue() {
    emit(ChangeValue());
  }
}

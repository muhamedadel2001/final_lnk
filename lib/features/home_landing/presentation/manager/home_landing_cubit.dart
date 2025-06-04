import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:final_lnk/core/connection/network_info.dart';
import 'package:final_lnk/core/databases/api/dio_consumer.dart';
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
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/const.dart';
import '../../../../core/util/property_model.dart';
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
                    apiConsumer: DioConsumer(dio: Dio()),
                  ),
                  propertiesLocalData: PropertiesLocalData(),
                ),
              ),
            ),
        child: PropertiesScreen(),
      );
    } else if (idx == 2) {
      return BlocProvider(
        create: (context) => RequestsCubit(),
        child: RequestsScreen(),
      );
    } else {
      return BlocProvider(
        create: (context) => SettingsCubit(),
        child: SettingsScreen(),
      );
    }
  }

  List<PropertyTypeModel> selectedPropertyTypesList = propertyTypesSubList;
  final ImagePicker _picker = ImagePicker();
  List<GlobalKey<FormState>> keys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  String titleButton = '';
  String propertyStatus = 'Sell';
  String propertyCategory = 'residential';
  String propertyType = 'Apartment';
  String payment = 'Cash';
  String city = ourCities[0];
  String? finishing;
  String? furnishing;
  int floorNom = 1;
  int installmentYears = 1;
  int roomsNom = 1;
  int bathroomsNom = 1;
  int balaconsNom = 1;
  int receptionPieces = 1;
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

  viewMoreOrLess() {
    if (selectedPropertyTypesList.length <= 6) {
      selectedPropertyTypesList = completedPropertyTypesList;
    } else {
      selectedPropertyTypesList = propertyTypesSubList;
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
        emit(GetOneFailure());
      },
      (success) {
        requestModel = success;
        emit(GetOneSuccess());
      },
    );
  }
}

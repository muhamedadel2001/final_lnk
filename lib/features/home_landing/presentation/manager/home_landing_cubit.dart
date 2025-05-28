import 'package:bloc/bloc.dart';
import 'package:final_lnk/features/main_home/presentation/screens/home_screen.dart';
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
  HomeLandingCubit() : super(HomeLandingInitial());

  static HomeLandingCubit get(context) =>
      BlocProvider.of<HomeLandingCubit>(context);

  int index = 0;
  List<Widget?> screens = [HomeScreen(), null, null, null];
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
      return HomeScreen();
    } else if (idx == 1) {
      return BlocProvider(
        create: (context) => PropertiesCubit(),
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
}

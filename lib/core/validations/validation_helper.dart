import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/core/networking/api_constants.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/settings/data/model/create_sub_model.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import '../../features/home_landing/data/models/create_request_model.dart';
import '../../features/settings/data/model/profile_model.dart';
import '../util/lang_keys.dart';

class Validations {
  static final RegExp _arabicRegex = RegExp(r'[\u0600-\u06FF]');
  static String? egyptianPhoneValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }
    final cleaned = val.trim();

    if (_arabicRegex.hasMatch(cleaned)) {
      return LangKeys.phoneValid;
    }

    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (!regex.hasMatch(cleaned)) {
      return LangKeys.phoneValid; // اعمل مفتاح الترجمة ده في lang
    }

    return null;
  }

  static String? passwordValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    if (val.length < 9) {
      return LangKeys.passValid;
    }

    if (_arabicRegex.hasMatch(val)) {
      return LangKeys.passValid;
    }

    return null;
  }

  static String? globalValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }
    return null;
  }

  static String? validateOtp(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    if (!RegExp(r'^\d{4}$').hasMatch(val.trim())) {
      return LangKeys.otpNotValid;
    }

    return null;
  }

  static String? emailValidation(String? val) {
    if (val == null || val.trim().isEmpty) {
      return LangKeys.fieldRequired;
    }

    if (!val.contains('@gmail.com')) {
      return LangKeys.validEmail;
    }

    if (_arabicRegex.hasMatch(val)) {
      return LangKeys.validEmail;
    }
    return null;
  }

  static checkFirstCreate(HomeLandingCubit cubit, BuildContext context) {
    if (cubit.userSelection.cityId != null &&
        cubit.userSelection.areaId != null) {
      Navigator.pushNamed(
        context,
        screens.secondAddPropertyScreen,
        arguments: cubit,
      );
    } else {
      CustomAlerts.showMySnackBar(context, LangKeys.validData);
    }
  }

  static checkSecondCreate(HomeLandingCubit cubit, BuildContext context) {
    if (cubit.isRequest) {
      if (cubit.propertyStatus == LangKeys.sale) {
        if (cubit.userSelection.floorNom != null &&
            isValidNumber(areaController.text) &&
            cubit.userSelection.furnishingId != null &&
            cubit.userSelection.finishingId != null &&
            isValidNumber(priceController.text) &&
            isValidNumber(insuranceOrDownController.text)) {
          Navigator.pushNamed(
            context,
            screens.thirdAddPropertyScreen,
            arguments: cubit,
          );
        } else {
          CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
        }
      } else {
        if (cubit.userSelection.floorNom != null &&
            isValidNumber(areaController.text) &&
            cubit.userSelection.furnishingId != null &&
            cubit.userSelection.finishingId != null &&
            isValidNumber(priceController.text) &&
            cubit.userSelection.typeOfRentId != null &&
            isValidNumber(insuranceOrDownController.text)) {
          Navigator.pushNamed(
            context,
            screens.thirdAddPropertyScreen,
            arguments: cubit,
          );
        } else {
          CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
        }
      }
    } else {
      if (cubit.propertyStatus == LangKeys.sale) {
        if (cubit.userSelection.floorNom != null &&
            isValidNumber(areaController.text) &&
            cubit.userSelection.furnishingId != null &&
            cubit.userSelection.finishingId != null &&
            isValidNumber(priceController.text)) {
          if (cubit.payment == LangKeys.cash) {
            Navigator.pushNamed(
              context,
              screens.thirdAddPropertyScreen,
              arguments: cubit,
            );
          } else {
            if (insuranceOrDownController.text.trim().isNotEmpty) {
              Navigator.pushNamed(
                context,
                screens.thirdAddPropertyScreen,
                arguments: cubit,
              );
            } else {
              CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
            }
          }
        } else {
          CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
        }
      } else {
        if (cubit.userSelection.floorNom != null &&
            isValidNumber(areaController.text) &&
            cubit.userSelection.furnishingId != null &&
            cubit.userSelection.finishingId != null &&
            isValidNumber(priceController.text) &&
            cubit.userSelection.typeOfRentId != null &&
            isValidNumber(insuranceOrDownController.text)) {
          Navigator.pushNamed(
            context,
            screens.thirdAddPropertyScreen,
            arguments: cubit,
          );
        } else {
          CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
        }
      }
    }
  }

  static bool isValidNumber(String input) {
    final trimmed = input.trim();
    final numberRegExp = RegExp(r'^\d+$'); // يقبل فقط أرقام صحيحة

    return trimmed.isNotEmpty && numberRegExp.hasMatch(trimmed);
  }

  static bool isValidEgyptianPhone(String input) {
    final trimmed = input.trim();
    final phoneRegExp = RegExp(
      r'^01[0-2,5]{1}[0-9]{8}$',
    ); // يبدأ بـ 01 ويتبعه 10 أرقام

    return trimmed.isNotEmpty && phoneRegExp.hasMatch(trimmed);
  }

  static checkThirdCreate(
    HomeLandingCubit addPropertyCubit,
    BuildContext context,
  ) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        isValidEgyptianPhone(phoneController.text) &&
        isValidEgyptianPhone(whatsController.text)) {
      if (addPropertyCubit.isRequest) {
        addPropertyCubit.createProperty(
          model: CreateRequestModel(
            type: addPropertyCubit.propertyStatus,
            typeOfRequest: addPropertyCubit.propertyCategory,
            apartment: addPropertyCubit.propertyType,
            city: addPropertyCubit.userSelection.cityId!,
            location: addPropertyCubit.userSelection.areaId!,
            floor: addPropertyCubit.userSelection.floorNom!,
            rooms:
                addPropertyCubit.propertyCategory != LangKeys.commercial
                    ? addPropertyCubit.userSelection.roomsNom
                    : null,
            bathRooms:
                addPropertyCubit.propertyCategory != LangKeys.commercial
                    ? addPropertyCubit.userSelection.bathroomsNom
                    : null,
            balcona:
                addPropertyCubit.propertyCategory != LangKeys.commercial
                    ? addPropertyCubit.userSelection.balaconsNom
                    : null,
            reseptionPieces:
                addPropertyCubit.propertyCategory != LangKeys.commercial
                    ? addPropertyCubit.userSelection.receptionPieces
                    : null,
            typeOfPay:
                addPropertyCubit.propertyStatus == LangKeys.sale
                    ? addPropertyCubit.payment
                    : null,
            typeOfRent:
                addPropertyCubit.propertyStatus == LangKeys.rent
                    ? addPropertyCubit.userSelection.typeOfRentId
                    : null,
            area: areaController.text,
            finishing: addPropertyCubit.userSelection.finishingId!,
            furnising: addPropertyCubit.userSelection.furnishingId!,
            maxPrice: insuranceOrDownController.text,
            minPrice: priceController.text,
            additional: addPropertyCubit.userSelection.additionalFeatures!,
            title: titleController.text,
            description: descriptionController.text,
            whatsApp: whatsController.text,
            phoneNumber: phoneController.text,
          ),
          context: context,
          endPoint: ApiConstants.addRequestEndpoint,
        );
      } else {
        Navigator.pushNamed(
          context,
          screens.fourthAddPropertyScreen,
          arguments: addPropertyCubit,
        );
      }
    } else {
      CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
    }
  }

  static checkForUpdate(
    SettingsCubit settingsCubit,
    BuildContext context,
  ) async {
    if (isValidEgyptianPhone(phoneController.text) &&
        name.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty) {
      print('enter');
      await settingsCubit.updateProfile(
        context: context,
        profileData:
            settingsCubit.profileImage != null &&
                    settingsCubit.profileImage != ''
                ? ProfileData(
                  image: settingsCubit.profileImage!.path,
                  userName: name.text,
                  phone: phoneController.text,
                  email: emailController.text,
                )
                : ProfileData(
                  userName: name.text,
                  phone: phoneController.text,
                  email: emailController.text,
                ),
      );
    } else {
      CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
    }
  }

  static checkForCreateSubAccount(
    SettingsCubit settingsCubit,
    BuildContext context,
  ) {
    if (isValidEgyptianPhone(phoneController.text) &&
        name.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty) {
      settingsCubit.createSubAccount(
        model: CreateSubModel(
          name: nameSubController.text,
          email: emailSubController.text,
          phone: phoneSubController.text,
        ),
        context: context,
      );
    } else {
      CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
    }
  }
}

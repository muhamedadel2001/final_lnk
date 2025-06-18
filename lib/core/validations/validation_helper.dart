import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

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

  static checkThirdCreate(HomeLandingCubit cubit, BuildContext context) {
    if (cubit.userSelection.additionalFeatures != null &&
        titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        isValidEgyptianPhone(phoneController.text) &&
        isValidEgyptianPhone(whatsController.text)) {
      if (cubit.userSelection.additionalFeatures!.isNotEmpty) {
        Navigator.pushNamed(
          context,
          screens.fourthAddPropertyScreen,
          arguments: cubit,
        );
      } else {
        CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
      }
    } else {
      CustomAlerts.showMySnackBar(context, LangKeys.validDataAndNumber);
    }
  }
}

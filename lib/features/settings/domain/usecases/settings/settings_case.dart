import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/create_sub_model.dart';
import 'package:final_lnk/features/settings/data/model/my_favourite_model.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/data/model/one_sub_account_model.dart';
import 'package:final_lnk/features/settings/data/model/sub_account_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/model/profile_model.dart';
import '../../repositories/settings/control_settings_repo.dart';

class SettingsUseCase {
  final SettingsRepo settingsRepo;

  SettingsUseCase({required this.settingsRepo});

  Future<Either<Failure, ProfileData>> getMyProfileCall({
    required BuildContext context,
  }) {
    return settingsRepo.getMyProfile(context: context);
  }

  Future updateProfile({required ProfileData profileData}) {
    return settingsRepo.updateProfile(profileData: profileData);
  }

  Future<Either<Failure, MyListModel>> getMyListCall({required String lang}) {
    return settingsRepo.getMyList(lang: lang);
  }

  Future<Either<Failure, MyRequestModel>> getMyRequestCall({
    required String lang,
  }) {
    return settingsRepo.getMyRequest(lang: lang);
  }

  Future<Either<Failure, SubAccountModel>> getMySubAccountCall({
    required String lang,
  }) {
    return settingsRepo.getMySubAccount(lang: lang);
  }

  Future<Either<Failure, OneSubAccountModel>> getOneSubAccountCall({
    required String lang,
    required String id,
  }) {
    return settingsRepo.getOneSubAccount(lang: lang, id: id);
  }

  Future deleteSubAccount({required BuildContext context, required String id}) {
    return settingsRepo.deleteSubAccount(id: id, context: context);
  }

  Future<Either<Failure, dynamic>> createSubAccount({
    required BuildContext context,
    required CreateSubModel model,
  }) {
    return settingsRepo.createSubAccount(model: model, context: context);
  }

  Future<Either<Failure, MyFavouriteModel>> getMyFavouriteCall({
    required BuildContext context,
    required String lang,
  }) {
    return settingsRepo.getMyFavourite(context: context, lang: lang);
  }

  /* Future logout(BuildContext context) {
    return controlSettingsRepo.logout(context);
  }*/
}

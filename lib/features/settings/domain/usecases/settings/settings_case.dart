import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/model/profile_model.dart';
import '../../repositories/settings/control_settings_repo.dart';

class SettingsUseCase {
  final SettingsRepo settingsRepo;

  SettingsUseCase({required this.settingsRepo});

  Future<Either<Failure, ProfileData>> getMyProfileCallCall({
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

  /* Future logout(BuildContext context) {
    return controlSettingsRepo.logout(context);
  }*/
}

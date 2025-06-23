import 'package:dartz/dartz.dart';
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

  /* Future logout(BuildContext context) {
    return controlSettingsRepo.logout(context);
  }

  Future delete(BuildContext context) {
    return controlSettingsRepo.delete(context);
  }*/
}

import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, ProfileData>> getMyProfile({
    required BuildContext context,
  });
  Future updateProfile({required ProfileData profileData});
  // Future logout(BuildContext context);
  //Future delete(BuildContext context);
}

import 'package:dartz/dartz.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/data/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, ProfileData>> getMyProfile({
    required BuildContext context,
  });
  Future updateProfile({required ProfileData profileData});
  Future<Either<Failure, MyListModel>> getMyList({required String lang});
  Future<Either<Failure, MyRequestModel>> getMyRequest({required String lang});
  // Future logout(BuildContext context);
}

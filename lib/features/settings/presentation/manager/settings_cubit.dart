import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/features/settings/data/model/my_list_model.dart';
import 'package:final_lnk/features/settings/data/model/my_request_model.dart';
import 'package:final_lnk/features/settings/domain/usecases/settings/settings_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/logic/file_utils.dart';
import '../../data/model/profile_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsUseCase settingsUseCase;
  SettingsCubit(this.settingsUseCase) : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);
  String? language;
  String? myImage;
  String? myTitle;
  MyListModel? myListModel;
  MyRequestModel? myRequestModel;
  File? profileImage;
  void update() {
    emit(Updated());
  }

  getMyProfile({required BuildContext context}) async {
    emit(ProfileLoading());
    final result = await settingsUseCase.getMyProfileCallCall(context: context);
    result.fold(
      (failure) {
        print(failure.errMessage);
        emit(ProfileFailure());
      },
      (success) {
        emit(ProfileSuccess());
        myTitle = success.titleOfUser;
        myImage = success.image;
        name.text = success.userName!;
        phoneController.text = success.phone;
        emailController.text = success.email;
      },
    );
  }

  getMyList({required String lang}) async {
    emit(GetMyListLoading());
    final result = await settingsUseCase.getMyListCall(lang: lang);
    result.fold(
      (failure) {
        emit(GetMyListFailure());
      },
      (success) {
        myListModel = success;
        emit(GetMyListSuccess());
      },
    );
  }

  getMyRequest({required String lang}) async {
    emit(GetMyRequestLoading());
    final result = await settingsUseCase.getMyRequestCall(lang: lang);
    result.fold(
      (failure) {
        emit(GetMyRequestFailure());
      },
      (success) {
        myRequestModel = success;
        emit(GetMyRequestSuccess());
      },
    );
  }

  updateProfile({
    required BuildContext context,
    required ProfileData profileData,
  }) async {
    emit(UpdateLoading());
    try {
      await settingsUseCase.updateProfile(profileData: profileData);
      getMyProfile(context: context);
    } catch (err) {
      emit(UpdateFailure());
    }
  }

  Future<void> updateImageMethod() async {
    profileImage = await FileUtils.pickImage(ImageSource.gallery);
    emit(ProfileSuccess());
  }
}

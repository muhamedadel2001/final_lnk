import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../data/on_boarding_model.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);
  int index = 0;
  final controller = PageController(initialPage: 0);
  List<OnBoardingModel> onBordingModelList = [];

  void initializeOnBoardingModels(BuildContext context) {
    onBordingModelList = [
      OnBoardingModel(
        imageUrl: 'assets/imgs/on_boarding/board1.png',
        title: LangKeys.onBoardingTitle1,
        subTitle: LangKeys.onBoardingSubTitle1,
      ),
      OnBoardingModel(
        imageUrl: 'assets/imgs/on_boarding/board2.png',
        title: LangKeys.onBoardingTitle2,
        subTitle: LangKeys.onBoardingSubTitle2,
      ),
      OnBoardingModel(
        imageUrl: 'assets/imgs/on_boarding/board3.png',
        title: LangKeys.onBoardingTitle3,
        subTitle: LangKeys.onBoardingSubTitle3,
      ),
    ];
  }

  void onChangePage(int idx) {
    index = idx;
    if (index == onBordingModelList.length - 1) {
      MyCache.setBool(key: MyCacheKeys.onBoardingViewed, value: true);
    }
    emit(idx);
  }

  nextPage(BuildContext context) {
    if (index == onBordingModelList.length - 1) {
      MyCache.setBool(key: MyCacheKeys.onBoardingViewed, value: true);
      Navigator.pushNamedAndRemoveUntil(
        context,
        screens.loginScreen,
        (route) => false,
      );
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  previousPage(BuildContext context) {
    controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

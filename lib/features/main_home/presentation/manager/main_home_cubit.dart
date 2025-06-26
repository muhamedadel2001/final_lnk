import 'package:bloc/bloc.dart';
import 'package:final_lnk/features/main_home/data/models/user_model.dart';
import 'package:final_lnk/features/main_home/domain/usecases/home_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'main_home_state.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  MainHomeCubit(this.getHomeUseCase) : super(MainHomeInitial());
  static MainHomeCubit get(context) => BlocProvider.of<MainHomeCubit>(context);
  final GetHomeUseCase getHomeUseCase;
  UserData? userData;
  bool isLoadingHomeData = true;

  getHomeData({required String lang, required BuildContext context}) async {
    emit(GetHomeLoading());
    final result = await getHomeUseCase.getHomeCall(
      lang: lang,
      context: context,
    );
    result.fold(
      (failure) {
        emit(GetHomeFailure(err: failure.errMessage));
      },
      (success) {
        userData = success;
        isLoadingHomeData = false;
        emit(GetHomeSuccess());
      },
    );
  }

  int currentBannerIndex = 0;

  void changeBannerIndex(int index) {
    currentBannerIndex = index;
    emit(BannerChanged()); // هنعرف BannerChanged تحت في state
  }

  void toggleFavoriteLocal({required String id, required bool isRequest}) {
    if (userData == null) return;
    if (isRequest) {
      final updatedRequests =
          userData!.homeRequests.map((item) {
            if (item.id == id) {
              return item.copyWith(isFavourite: !item.isFavourite);
            }
            return item;
          }).toList();
      userData = userData!.copyWith(homeRequests: updatedRequests);
    } else {
      final updatedListings =
          userData!.homeListing.map((item) {
            if (item.id == id) {
              return item.copyWith(isFavourite: !item.isFavourite);
            }
            return item;
          }).toList();
      userData = userData!.copyWith(homeListing: updatedListings);
    }

    emit(MainHomeUpdated()); // state جديدة تخلّي الـ UI يتحدّث
  }
}

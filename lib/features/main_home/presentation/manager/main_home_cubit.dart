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
}

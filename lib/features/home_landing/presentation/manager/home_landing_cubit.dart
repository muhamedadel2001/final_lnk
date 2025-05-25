import 'package:bloc/bloc.dart';
import 'package:final_lnk/features/main_home/presentation/screens/home_screen.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/properties_screen.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/requests_screen.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../settings/presentation/screens/settings_screen.dart';
import '../screens/menu_screen.dart';

part 'home_landing_state.dart';

class HomeLandingCubit extends Cubit<HomeLandingState> {
  HomeLandingCubit() : super(HomeLandingInitial());
  static HomeLandingCubit get(context) =>
      BlocProvider.of<HomeLandingCubit>(context);

  int index = 0;
  List<Widget?> screens = [HomeScreen(), null, null, null];
  int cnt = 0;

  onTransition(int idx) {
    if (index != idx) {
      index = idx;
      if (screens[idx] == null) {
        screens[idx] = _getPage(idx);
      }
      emit(ScreenChanged());
    }
  }

  Widget _getPage(int idx) {
    if (idx == 0) {
      return HomeScreen();
    } else if (idx == 1) {
      return PropertiesScreen();
    } else if (idx == 2) {
      return const RequestScreen();
    } else {
      return BlocProvider(
        create: (context) => SettingsCubit(),
        child: SettingsScreen(),
      );
    }
  }
}

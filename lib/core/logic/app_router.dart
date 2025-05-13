import 'package:dio/dio.dart';
import 'package:final_lnk/core/databases/api/dio_consumer.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:final_lnk/features/auth/domain/usecases/signup_usecase.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:final_lnk/features/auth/presentation/screens/login_screen.dart';
import 'package:final_lnk/features/on_boarding/manager/cubit/on_boarding_cubit.dart';
import 'package:final_lnk/features/on_boarding/presentation/screens/get_started_screen.dart';
import 'package:final_lnk/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../util/screens.dart' as screens;

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings routeSettings) {
    startScreen = GetStartedScreen();
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.onBoardingScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => OnBoardingCubit(),
                child: OnBoardingScreen(),
              ),
        );
      case screens.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => AuthCubit(
                      signupUseCase: SignupUseCase(
                        authRepositories: AuthRepositoriesImpl(
                          apiConsumer: DioConsumer(dio: Dio()),
                        ),
                      ),
                    ),
                child: LoginScreen(),
              ),
        );
    }
    return null;
  }
}

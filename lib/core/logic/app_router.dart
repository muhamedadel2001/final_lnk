import 'package:dio/dio.dart';
import 'package:final_lnk/core/databases/api/dio_consumer.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:final_lnk/features/auth/domain/usecases/signup_usecase.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:final_lnk/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/login_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/otp_verfication_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/register_agency_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/register_freelancer_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:final_lnk/features/auth/presentation/screens/select_account_type.dart';
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
      case screens.selectAccTypeScreen:
        final cubit = routeSettings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: SelectAccountTypeScreen(),
              ),
        );
      case screens.agencyScreen:
        final cubit = routeSettings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: RegisterAgencyScreen(),
              ),
        );
      case screens.freelanceScreen:
        final cubit = routeSettings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: RegisterFreelancerScreen(),
              ),
        );
      case screens.otpScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final isRegister = args['isRegister'] as String;
        final cubit = args['cubit'] as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: OtpVerificationScreen(isRegister: isRegister),
              ),
        );
      case screens.forgetScreen:
        final cubit = routeSettings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: ForgetPasswordScreen(),
              ),
        );
      case screens.changePassScreen:
        final cubit = routeSettings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: ResetPasswordScreen(),
              ),
        );
    }
    return null;
  }
}

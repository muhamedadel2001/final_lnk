import 'package:dio/dio.dart';
import 'package:final_lnk/core/databases/api/dio_consumer.dart';
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
import 'package:final_lnk/features/home_landing/data/datasources/responses_remote_data.dart';
import 'package:final_lnk/features/home_landing/data/repositories/responses_repo_impl.dart';
import 'package:final_lnk/features/home_landing/domain/usecases/responses_usecases.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/home_landing.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/first_page_add_property.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/forth_page_add_property.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/second_page_add_property.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/third_page_add_property.dart';
import 'package:final_lnk/features/main_home/presentation/screens/single_requset_view_screen.dart';
import 'package:final_lnk/features/main_home/presentation/screens/single_residential_property_view.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/photo_gallery_screen.dart';
import 'package:final_lnk/features/on_boarding/manager/cubit/on_boarding_cubit.dart';
import 'package:final_lnk/features/on_boarding/presentation/screens/get_started_screen.dart';
import 'package:final_lnk/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/filter_properties_screen.dart';
import 'package:final_lnk/features/properties/presentation/screens/result_filter_properties_screen.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/screens/filter_requests_screen.dart';
import 'package:final_lnk/features/requests/presentaion/screens/result_filter_requests_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/add_sub_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/contact_us_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/favourites_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/profile_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/sub_acc_setails_screen.dart';
import 'package:final_lnk/features/settings/presentation/screens/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../../features/settings/presentation/screens/widgets/language_screen.dart';
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
      case screens.homeLandingScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => HomeLandingCubit(
                      ResponsesUseCase(
                        responsesRepo: ResponsesRepoImpl(
                          responsesRemoteData: ResponsesRemoteData(
                            apiConsumer: DioConsumer(
                              dio: Dio(
                                BaseOptions(
                                  connectTimeout: Duration(seconds: 60),
                                  receiveTimeout: Duration(seconds: 60),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                child: HomeLanding(),
              ),
        );
      case screens.languageScreen:
        final cubit = routeSettings.arguments as SettingsCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: const LanguageScreen(),
              ),
        );
      case screens.termsScreen:
        return MaterialPageRoute<String>(builder: (_) => const TermsScreen());
      case screens.favouriteScreen:
        return MaterialPageRoute<String>(
          builder: (_) => const FavouritesScreen(),
        );
      case screens.contactScreen:
        return MaterialPageRoute<String>(
          builder: (_) => const ContactUsScreen(),
        );
      case screens.profileScreen:
        final isAgency = routeSettings.arguments as bool;
        return MaterialPageRoute<String>(
          builder: (_) => ProfileScreen(isAgency: isAgency),
        );
      case screens.subAccDetailsScreenScreen:
        return MaterialPageRoute<String>(
          builder: (_) => const SubAccountDetailsScreen(),
        );
      case screens.addSubScreen:
        return MaterialPageRoute<String>(builder: (_) => const AddSubScreen());
      case screens.singlePropertyScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final id = args['id'] as String;
        final cubit = args['cubit'] as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: SingleResidentialPropertyView(id: id),
              ),
        );
      case screens.photoListScreen:
        final cubit = routeSettings.arguments as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) =>
                  BlocProvider.value(value: cubit, child: PhotoGalleryScreen()),
        );
      case screens.singleRequestScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final id = args['id'] as String;
        final cubit = args['cubit'] as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: SingleRequsetViewScreen(id: id),
              ),
        );
      case screens.firstAddPropertyScreen:
        final cubit = routeSettings.arguments as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: FirstPageAddProperty(),
              ),
        );
      case screens.secondAddPropertyScreen:
        final cubit = routeSettings.arguments as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: SecondPageAddProperty(),
              ),
        );
      case screens.thirdAddPropertyScreen:
        final cubit = routeSettings.arguments as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: ThirdPageAddProperty(),
              ),
        );
      case screens.fourthAddPropertyScreen:
        final cubit = routeSettings.arguments as HomeLandingCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: ForthPageAddProperty(),
              ),
        );
      case screens.filterProprtiesScreen:
        final cubit = routeSettings.arguments as PropertiesCubit;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: cubit,
                child: FilterPropertiesScreen(),
              ),
        );
      case screens.resultFilterPropertiesScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final propertiesCubit = args['propertiesCubit'] as PropertiesCubit;
        final minArea = args['minArea'] as String;
        final maxArea = args['maxArea'] as String;
        final minPrice = args['minPrice'] as String;
        final maxPrice = args['maxPrice'] as String;
        return MaterialPageRoute<String>(
          builder:
              (_) => BlocProvider.value(
                value: propertiesCubit,
                child: ResultFilterPropertiesScreen(
                  minArea: minArea,
                  maxArea: maxArea,
                  minPrice: minPrice,
                  maxPrice: maxPrice,
                ),
              ),
        );
      case screens.resultFilterRequestsScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final requestsCubit = args['requestsCubit'] as RequestsCubit;
        final homeLandingCubit = args['homeLandingCubit'] as HomeLandingCubit;

        return MaterialPageRoute<String>(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: homeLandingCubit),
                  BlocProvider.value(value: requestsCubit),
                ],
                child: ResultFilterRequestsScreen(),
              ),
        );
      case screens.filterRequestsScreen:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final requestsCubit = args['requestsCubit'] as RequestsCubit;
        final homeLandingCubit = args['homeLandingCubit'] as HomeLandingCubit;

        return MaterialPageRoute<String>(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: homeLandingCubit),
                  BlocProvider.value(value: requestsCubit),
                ],
                child: FilterRequestScreen(),
              ),
        );
    }
    return null;
  }
}

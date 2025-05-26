import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/databases/cache/my_cache.dart';
import 'core/databases/cache/my_cache_keys.dart';
import 'core/logic/app_router.dart';
import 'core/logic/bloc_observer.dart';
import 'core/logic/resp_calc.dart';
import 'core/util/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    MyCache.initCache(),
    EasyLocalization.ensureInitialized(),
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  String? savedLanguageCode = MyCache.getString(key: MyCacheKeys.language);
  Locale startLocale =
      savedLanguageCode == 'ar'
          ? const Locale('ar', 'EG')
          : const Locale('en', 'US');
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: startLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryClr),
        scaffoldBackgroundColor: backgroundClr,
        appBarTheme: AppBarTheme(backgroundColor: backgroundClr),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(360, 800),
          builder: (_, __) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        );
      },
    );
  }
}

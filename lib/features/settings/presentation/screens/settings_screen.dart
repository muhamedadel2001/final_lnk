import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/widgets/custom_dialog.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/settings/presentation/screens/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            screens.loginScreen,
            (route) => false,
          );
          MyCache.removeFromCache(key: MyCacheKeys.token);
        }
      },
      buildWhen: (previous, current) => current is Updated,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LangKeys.menu, style: getStyle20(context)),
                    SizedBox(height: 11.h),
                    const Divider(thickness: 1, color: Color(0xff5A5A5A)),
                  ],
                ),
                const SizedBox(height: 24),
                MenuItem(
                  iconData: Icons.person,
                  title: LangKeys.profile,
                  callBack: () {
                    Navigator.pushNamed(
                      context,
                      screens.profileScreen,
                      arguments: {
                        "homeLandingCubit": HomeLandingCubit.get(context),
                        "settingsCubit": SettingsCubit.get(context),
                      },
                    );
                  },
                  hasIcon: true,
                  isDanger: false,
                ),
                const SizedBox(height: 12),
                MenuItem(
                  iconData: Icons.language_outlined,
                  title: LangKeys.language,
                  callBack: () async {
                    String? refresh = await Navigator.pushNamed(
                      context,
                      screens.languageScreen,
                      arguments: BlocProvider.of<SettingsCubit>(context),
                    );
                    if (refresh == 'refresh') {
                      HomeLandingCubit.get(context).emit(ScreenChanged());
                    }
                  },
                  hasIcon: true,
                  isDanger: false,
                ),
                const SizedBox(height: 12),
                MenuItem(
                  iconData: Icons.favorite,
                  title: LangKeys.favourite,
                  callBack: () {
                    Navigator.pushNamed(
                      context,
                      screens.favouriteScreen,
                      arguments: {
                        'settingsCubit': SettingsCubit.get(context),
                        'homeLandingCubit': HomeLandingCubit.get(context),
                      },
                    );
                  },
                  hasIcon: true,
                  isDanger: false,
                ),
                const SizedBox(height: 12),
                MenuItem(
                  imgUrl: 'assets/imgs/menu_icons/contact.png',
                  isDanger: false,
                  title: LangKeys.contactUs,
                  hasIcon: true,
                  callBack: () {
                    Navigator.pushNamed(context, screens.contactScreen);
                  },
                ),
                const SizedBox(height: 12),
                MenuItem(
                  iconData: Icons.rule_sharp,
                  isDanger: false,
                  title: LangKeys.terms,
                  hasIcon: true,
                  callBack:
                      () => {Navigator.pushNamed(context, screens.termsScreen)},
                ),
                const SizedBox(height: 12),
                MenuItem(
                  imgUrl: 'assets/imgs/menu_icons/logout.png',
                  isDanger: true,
                  title: LangKeys.logout,
                  hasIcon: true,
                  callBack: () {
                    showCustomDialog(context, LangKeys.deleteSureLogout, () {
                      SettingsCubit.get(context).logout(context);
                      Navigator.pop(context);
                    });
                  },
                ),
                const SizedBox(height: 22),
                GestureDetector(
                  onTap: () {
                    showCustomDialog(context, LangKeys.deleteSureAcc, () {
                      SettingsCubit.get(context).deleteAcc(context);
                      Navigator.pop(context);
                    });
                  },
                  child: Center(
                    child: Text(
                      LangKeys.deleteAcc,
                      style: getStyleBold16(
                        context,
                      ).copyWith(color: primaryClr),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

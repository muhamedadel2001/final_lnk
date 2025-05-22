import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
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
    print('setting screen');
    return BlocBuilder<SettingsCubit, SettingsState>(
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
                      arguments: true,
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
                  iconData: Icons.notifications_outlined,
                  title: LangKeys.notifications,
                  callBack: () {},
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
                  callBack: () {},
                ),
                const SizedBox(height: 22),
                Center(
                  child: Text(
                    LangKeys.deleteAcc,
                    style: getStyleBold16(context).copyWith(color: primaryClr),
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

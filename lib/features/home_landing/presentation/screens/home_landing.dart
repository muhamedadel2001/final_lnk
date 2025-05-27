import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import '../manager/home_landing_cubit.dart';

class HomeLanding extends StatelessWidget {
  const HomeLanding({super.key});

  @override
  Widget build(BuildContext context) {
    print('landing screen');
    final landingCubit = BlocProvider.of<HomeLandingCubit>(context);

    return BlocBuilder<HomeLandingCubit, HomeLandingState>(
      buildWhen: (previous, current) => current is ScreenChanged,
      builder: (context, state) {
        print('landing screen builder');
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: landingCubit.index,
                children:
                    landingCubit.screens
                        .map((screen) => screen ?? const SizedBox.shrink())
                        .toList(),
              ),
              if (landingCubit.isDialOpen)
                Positioned(
                  bottom: 40.h,
                  left: 0.5.sw - 40.w,
                  child: Column(
                    children: [
                      _FloatingActionButtonMini(
                        iconPath: 'assets/imgs/nav_bar_assets/add-request.png',
                        label: LangKeys.request,
                        onTap: () {
                          landingCubit.isRequest = true;
                          Navigator.pushNamed(
                            context,
                            screens.firstAddPropertyScreen,
                            arguments: landingCubit,
                          );
                          landingCubit.closeDial();
                        },
                      ),
                      SizedBox(height: 12.h),
                      _FloatingActionButtonMini(
                        iconPath: 'assets/imgs/nav_bar_assets/add-post.png',
                        label: LangKeys.post,
                        onTap: () {
                          landingCubit.isRequest = false;
                          Navigator.pushNamed(
                            context,
                            screens.firstAddPropertyScreen,
                            arguments: landingCubit,
                          );
                          landingCubit.closeDial();
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),

          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 12.0.w,
            child: Container(
              height: max(76.h, 76.h),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomNavItem(
                    icon: 'assets/imgs/nav_bar_assets/inactive_nav_1.png',
                    activeIcon: 'assets/imgs/nav_bar_assets/active_nav_1.png',
                    label: LangKeys.home,
                    isActive: landingCubit.index == 0,
                    onTap: () {
                      landingCubit.closeDial();
                      landingCubit.onTransition(0);
                    },
                  ),
                  _BottomNavItem(
                    icon: 'assets/imgs/nav_bar_assets/inactive_nav_2.png',
                    activeIcon: 'assets/imgs/nav_bar_assets/active_nav_2.png',
                    label: LangKeys.properties,
                    isActive: landingCubit.index == 1,
                    onTap: () {
                      landingCubit.closeDial();
                      landingCubit.onTransition(1);
                    },
                  ),
                  SizedBox(width: 40.w),
                  _BottomNavItem(
                    icon: 'assets/imgs/nav_bar_assets/inactive_nav_3.png',
                    activeIcon: 'assets/imgs/nav_bar_assets/active_nav_3.png',
                    label: LangKeys.requests,
                    isActive: landingCubit.index == 2,
                    onTap: () {
                      landingCubit.closeDial();
                      landingCubit.onTransition(2);
                    },
                  ),
                  _BottomNavItem(
                    icon: 'assets/imgs/nav_bar_assets/inactive_nav_4.png',
                    activeIcon: 'assets/imgs/nav_bar_assets/active_nav_4.png',
                    label: LangKeys.menu,
                    isActive: landingCubit.index == 3,
                    onTap: () {
                      landingCubit.closeDial();
                      landingCubit.onTransition(3);
                    },
                  ),
                ],
              ),
            ),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryClr,
            child: Icon(
              landingCubit.isDialOpen ? Icons.close : Icons.add,
              color: Colors.white,
            ),
            onPressed: landingCubit.toggleDial,
          ),
        );
      },
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(isActive ? activeIcon : icon, width: 20.w, height: 20.h),
          SizedBox(height: 4.h),
          Text(
            label,
            style:
                isActive
                    ? getStyle13(context).copyWith(color: primaryClr)
                    : getStyleBold13(
                      context,
                    ).copyWith(color: const Color(0xff9F9F9F)),
          ),
        ],
      ),
    );
  }
}

class _FloatingActionButtonMini extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _FloatingActionButtonMini({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                color: primaryClr,
              ),
              SizedBox(width: 8.w),
              Text(
                label,
                style: getStyle13(context).copyWith(color: primaryClr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

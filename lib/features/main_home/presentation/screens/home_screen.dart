import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/custom_appbar_home.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_propeties.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/featured_requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('home init');
    super.initState();
  }

  @override
  void dispose() {
    print('close');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('home ');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomAppbarHome(userName: 'Moahmed'),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(LangKeys.propertiesOffered, style: getStyle20(context)),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LangKeys.viewAll,
                      style: getStyle13(
                        context,
                      ).copyWith(color: textSecondaryClr),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              const FeaturedPropeties(),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(LangKeys.requests, style: getStyle20(context)),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LangKeys.viewAll,
                      style: getStyle13(
                        context,
                      ).copyWith(color: textSecondaryClr),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              const FeaturedRequests(),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}

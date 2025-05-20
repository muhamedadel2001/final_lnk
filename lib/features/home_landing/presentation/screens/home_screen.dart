import 'package:final_lnk/features/home_landing/presentation/screens/widgets/custom_appbar_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Widget build(BuildContext context) {
    print('home ');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CustomAppbarHome(userName: 'Moahmed'),
          ],
        ),
      ),
    );
  }
}

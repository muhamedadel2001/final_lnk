import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/resp_calc.dart';
import '../util/colors.dart';

class LogoutLoadingPage extends StatelessWidget {
  const LogoutLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black54,
      child: Center(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: CircularProgressIndicator(color: primaryClr),
        ),
      ),
    );
  }
}

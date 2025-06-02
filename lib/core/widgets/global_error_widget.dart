import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalErrorWidget extends StatelessWidget {
  final String message;
  final String? imagePath;

  const GlobalErrorWidget({
    super.key,
    this.message = 'حدث خطأ أثناء جلب البيانات، حاول مرة أخرى لاحقًا.',
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath != null
              ? Image.asset(imagePath!, width: 130.w)
              : Icon(Icons.error_outline, color: Colors.redAccent),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              message,
              style: getStyle20(context),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

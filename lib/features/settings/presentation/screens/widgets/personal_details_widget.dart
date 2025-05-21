import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDetailsTab extends StatelessWidget {
  final details = const ["Ahmed mohamed", "123345569", "ahmed@email.com"];

  const PersonalDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text("Edit", style: TextStyle(color: Colors.grey)),
          ),
          SizedBox(height: 10.h),
          ...details.map(
            (text) => Container(
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF1F2F2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(text, style: TextStyle(fontSize: 14.sp)),
            ),
          ),
        ],
      ),
    );
  }
}

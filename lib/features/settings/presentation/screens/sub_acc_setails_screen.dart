import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubAccountDetailsScreen extends StatelessWidget {
  const SubAccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: dangerClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                LangKeys.deleteAcc,
                style: getStyleBold13(context).copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, 'refresh');
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/hoda.jpeg'),
                  radius: 30.r,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Muhamed Adel', style: getStyleBold16(context)),
                      Text('mohamedadel@gmail.com', style: getStyle13(context)),
                      Text('01202735983', style: getStyle13(context)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: primaryClr,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '${LangKeys.role}: Broker at Nour Agency',
                style: getStyle13(context),
              ),
            ),

            SizedBox(height: 40.h),
            Text(LangKeys.recentActivity, style: getStyle20(context)),
            SizedBox(height: 16.h),
            _buildActivityTile(
              'Added Post',
              '10 units out of 50 have been consumed.',
              context,
            ),
            _buildActivityTile(
              'Added Request',
              '10 units out of 50 have been consumed.',
              context,
            ),
            _buildActivityTile(
              'Edited Post',
              '10 units out of 50 have been consumed.',
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTile(
    String title,
    String subtitle,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF88A98F), width: 2.w),
                shape: BoxShape.circle,
              ),
              child: Container(
                width: 12.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: primaryClr,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: geryBorderActivityClr, width: 2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text('Monday 3 sep 2024', style: getStyle16(context)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, bottom: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: getStyleBold16(context)),
                  TextButton(onPressed: () {}, child: Text(LangKeys.view)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

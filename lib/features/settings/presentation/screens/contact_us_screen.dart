import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/lang_keys.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              LangKeys.contactTitle,
              style: getStyleBold16(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: ContactOptionCard(
                    icon: Icons.phone_in_talk_outlined,
                    title: LangKeys.contactUs,
                    subtitle: LangKeys.respondCall,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ContactOptionCard(
                    icon: Icons.email_outlined,
                    title: LangKeys.emailUs,
                    subtitle: LangKeys.willRespond,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(LangKeys.message, style: getStyleBold16(context)),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 120.h),
                child: TextField(
                  maxLines: null,
                  maxLength: 500,
                  decoration: InputDecoration.collapsed(
                    hintText: LangKeys.typeMessage,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: PrimaryButton(callBack: () {}, text: LangKeys.submit),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ContactOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF7BA187).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF7BA187), size: 28.sp),
          SizedBox(height: 8.h),
          Text(title, style: getStyleBold13(context)),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: getStyle13(context).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

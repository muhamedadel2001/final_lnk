import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    onTap: () async {
                      await launchUrl(Uri(scheme: 'tel', path: '01115558590'));
                    },
                    icon: Icons.phone_in_talk_outlined,
                    title: LangKeys.contactUs,
                    subtitle: LangKeys.respondCall,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ContactOptionCard(
                    onTap: () async {
                      final Uri whatsappUri = Uri.parse(
                        'https://wa.me/201115558590',
                      );
                      if (await canLaunchUrl(whatsappUri)) {
                        await launchUrl(
                          whatsappUri,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        throw 'لا يمكن فتح WhatsApp';
                      }
                    },
                    icon: Icons.email_outlined,
                    title: LangKeys.emailUs,
                    subtitle: LangKeys.willRespond,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.support_agent_outlined,
                    color: const Color(0xFF7BA187),
                    size: 32.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    LangKeys.weAreHereToHelp,
                    style: getStyleBold16(context),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    LangKeys.weAreHereToHelpDes,
                    textAlign: TextAlign.center,
                    style: getStyle13(
                      context,
                    ).copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
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
  final void Function() onTap;

  const ContactOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

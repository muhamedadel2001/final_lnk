import 'dart:ui';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../util/const_controllers.dart';

class SubscriptionDialog extends StatelessWidget {
  const SubscriptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80.sp),
                      child: Image.asset(kLogo, width: 80.w, height: 80.w),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      LangKeys.subscriptionRequired,
                      style: getStyle25(context),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      LangKeys.contactUsToUnlock,
                      textAlign: TextAlign.center,
                      style: getStyleBold16(context),
                    ),
                    SizedBox(height: 15.h),
                    Image.asset(subImage, height: 150.h),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                0xFF6C8B74,
                              ), // اللون من الصورة
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 14.h,
                              ),
                            ),
                            onPressed: () async {
                              await launchUrl(
                                Uri(scheme: 'tel', path: '01115558590'),
                              );
                            },
                            child: Text(
                              LangKeys.call,
                              style: getStyle13(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(
                                0xFF6C8B74,
                              ), // اللون من الصورة
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 32.w,
                                vertical: 14.h,
                              ),
                            ),
                            onPressed: () async {
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
                            child: Text(
                              LangKeys.whatsApp,
                              style: getStyle13(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Text(
                      LangKeys.callUsForSub,
                      textAlign: TextAlign.center,
                      style: getStyle13(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

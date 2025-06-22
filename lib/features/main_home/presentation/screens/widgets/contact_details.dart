import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/data/models/requests_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/primary_button.dart';

class ContactDetails extends StatelessWidget {
  final dynamic value;
  const ContactDetails({super.key, required this.value});

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            callBack: () async {
              await launchUrl(Uri(scheme: 'tel', path: value.phoneNumber));
            },
            text: LangKeys.call,
            height: 55.h,
            width: 80.w,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PrimaryButton(
            callBack: () async {
              final Uri whatsappUri = Uri.parse(
                'https://wa.me/2${value.whatsApp}',
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
            text: LangKeys.message,
            backgroundClr: backgroundClr,
            style: getStyle20(
              context,
            ).copyWith(color: primaryClr, fontSize: 18.sp),
            height: 55.h,
            width: 80.w,
          ),
        ),
      ],
    );
  }
}

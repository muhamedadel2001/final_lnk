import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/primary_button.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            callBack: () {},
            text: LangKeys.call,
            height: 55.h,
            width: 80.w,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: PrimaryButton(
            callBack: () {},
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

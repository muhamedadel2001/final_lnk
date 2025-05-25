import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'colors.dart';

bool isEnglish(BuildContext context) => context.locale.languageCode == 'en';

TextStyle getStyle10(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 10.sp, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 10.sp, fontWeight: FontWeight.w700);

TextStyle getStyle13(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 13.sp, fontWeight: FontWeight.w500)
        : GoogleFonts.cairo(fontSize: 13.sp, fontWeight: FontWeight.w500);

TextStyle getStyleBold13(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 13.sp, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 13.sp, fontWeight: FontWeight.w700);

TextStyle getStyle16(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 16.sp, fontWeight: FontWeight.w400)
        : GoogleFonts.cairo(fontSize: 16.sp, fontWeight: FontWeight.w400);

TextStyle getStyleBold16(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 16.sp, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 16.sp, fontWeight: FontWeight.w700);

TextStyle getStyle20(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 20.sp, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 20.sp, fontWeight: FontWeight.w700);

TextStyle getStyle25(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 25.sp, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 25.sp, fontWeight: FontWeight.w700);

TextStyle getStyle39(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(
          fontSize: 39.sp,
          fontWeight: FontWeight.w700,
          color: textPrimaryClr,
        )
        : GoogleFonts.cairo(
          fontSize: 39.sp,
          fontWeight: FontWeight.w700,
          color: textPrimaryClr,
        );

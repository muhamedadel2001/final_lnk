import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'colors.dart';

bool isEnglish(BuildContext context) => context.locale.languageCode == 'en';

TextStyle getStyle10(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 10, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 10, fontWeight: FontWeight.w700);

TextStyle getStyle13(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w500)
        : GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w500);

TextStyle getStyleBold13(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w700);

TextStyle getStyle16(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w400)
        : GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w400);

TextStyle getStyleBold16(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700);

TextStyle getStyle20(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w700);

TextStyle getStyle25(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.w700)
        : GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.w700);

TextStyle getStyle39(BuildContext context) =>
    isEnglish(context)
        ? GoogleFonts.quicksand(
          fontSize: 39,
          fontWeight: FontWeight.w700,
          color: textPrimaryClr,
        )
        : GoogleFonts.cairo(
          fontSize: 39,
          fontWeight: FontWeight.w700,
          color: textPrimaryClr,
        );

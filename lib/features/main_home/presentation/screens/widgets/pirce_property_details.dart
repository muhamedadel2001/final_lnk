import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class PircePropertyDetails extends StatelessWidget {
  const PircePropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      color: const Color(0xffF5F5F5),
      child: Column(
        children: [
          Row(
            children: [
              Text(LangKeys.price, style: getStyleBold16(context)),
              const Spacer(),
              Text(
                '5.000.000 EG',
                style: getStyleBold16(context).copyWith(color: primaryClr),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(LangKeys.paymentMethod, style: getStyleBold16(context)),
              const Spacer(),
              Text(
                LangKeys.installments,
                style: getStyleBold16(context).copyWith(color: primaryClr),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

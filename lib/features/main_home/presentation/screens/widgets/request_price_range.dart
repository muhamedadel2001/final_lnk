import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestPriceRange extends StatelessWidget {
  const RequestPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LangKeys.price, style: getStyleBold16(context)),
          const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  '5.000.000 EG',
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
              const SizedBox(width: 22),
              Flexible(
                child: Text(
                  '28.000.000 EG',
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(LangKeys.paymentMethod, style: getStyleBold16(context)),
          const SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Installments',
                style: getStyleBold16(context).copyWith(color: primaryClr),
              ),
              const SizedBox(width: 22),
              Text(
                '16 Years',
                style: getStyleBold16(context).copyWith(color: primaryClr),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class PircePropertyDetails extends StatelessWidget {
  const PircePropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
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
                cubit.listsModel!.list.price,
                style: getStyleBold16(context).copyWith(color: primaryClr),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              cubit.listsModel!.list.type == 'sale' ||
                      cubit.listsModel!.list.type == "بيع"
                  ? Text(LangKeys.paymentMethod, style: getStyleBold16(context))
                  : Text(LangKeys.type, style: getStyleBold16(context)),
              const Spacer(),
              cubit.listsModel!.list.type == 'sale' ||
                      cubit.listsModel!.list.type == "بيع"
                  ? Text(
                    cubit.listsModel!.list.typeOfPay!,
                    style: getStyleBold16(context).copyWith(color: primaryClr),
                  )
                  : Text(
                    cubit.listsModel!.list.typeOfRent!.name!,
                    style: getStyleBold16(context).copyWith(color: primaryClr),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

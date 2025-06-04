import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestPriceRange extends StatelessWidget {
  const RequestPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
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
                  cubit.requestModel!.request.minPrice!,
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
              const SizedBox(width: 22),
              Flexible(
                child: Text(
                  cubit.requestModel!.request.maxPrice!,
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            cubit.requestModel!.request.type == 'sale' ||
                    cubit.requestModel!.request.type == 'بيع'
                ? LangKeys.paymentMethod
                : LangKeys.type,
            style: getStyleBold16(context),
          ),
          const SizedBox(height: 9),
          cubit.requestModel!.request.type == 'sale' ||
                  cubit.requestModel!.request.type == 'بيع'
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.requestModel!.request.typeOfPay!,
                    style: getStyleBold16(context).copyWith(color: primaryClr),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.requestModel!.request.typeOfRent.name!,
                    style: getStyleBold16(context).copyWith(color: primaryClr),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

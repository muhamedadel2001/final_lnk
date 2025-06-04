import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';

class RequestLocationDetails extends StatelessWidget {
  const RequestLocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(LangKeys.city, style: getStyleBold16(context)),
              const Spacer(),
              Flexible(
                child: Text(
                  cubit.requestModel!.request.city.name!,
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(LangKeys.location, style: getStyleBold16(context)),
              const Spacer(),
              Flexible(
                child: Text(
                  cubit.requestModel!.request.location.name!,
                  style: getStyleBold16(context).copyWith(color: primaryClr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

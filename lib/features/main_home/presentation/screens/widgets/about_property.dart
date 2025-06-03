import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/colors.dart';
import '../../../../../core/util/lang_keys.dart';

class AboutProperty extends StatelessWidget {
  const AboutProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeLandingCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
      color: const Color(0xffF5F5F5),
      child: Column(
        children: [
          Row(
            children: [
              Text(LangKeys.finishingType, style: getStyleBold16(context)),
              Text(': ', style: getStyleBold16(context)),
              Flexible(
                child: Text(
                  cubit.listsModel!.list.finishing!.name,
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(LangKeys.furnishing, style: getStyleBold16(context)),
              Text(': ', style: getStyleBold16(context)),
              Flexible(
                child: Text(
                  cubit.listsModel!.list.furnising!.name!,
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(LangKeys.additionalFeatures, style: getStyleBold16(context)),
              Text(': ', style: getStyleBold16(context)),
              Flexible(
                child: Text(
                  cubit.listsModel!.list.additional
                      .map((e) => e.name ?? '')
                      .join('-'),
                  style: getStyleBold16(
                    context,
                  ).copyWith(color: textSecondaryClr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

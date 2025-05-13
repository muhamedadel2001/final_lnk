import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../manager/cubit/on_boarding_cubit.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final boardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            boardingCubit.onBordingModelList.length,
            (idx) => Container(
              margin: const EdgeInsets.only(left: 2, right: 2),
              width:
                  idx == state
                      ? RespCalc().widthRatio(18)
                      : RespCalc().widthRatio(13),
              height: RespCalc().heightRatio(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: idx == state ? secondaryClr : accentClr,
              ),
            ),
          ),
        );
      },
    );
  }
}

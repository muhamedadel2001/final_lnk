import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../manager/cubit/on_boarding_cubit.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final boardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: PrimaryButton(
            text:
                state != boardingCubit.onBordingModelList.length - 1
                    ? LangKeys.next
                    : LangKeys.start,
            callBack: () {
              boardingCubit.nextPage(context);
            },
          ),
        );
      },
    );
  }
}

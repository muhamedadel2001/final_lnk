import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/colors.dart';
import 'custom_radio_button.dart';

class OptionBox extends StatelessWidget {
  const OptionBox({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Container(
      margin: const EdgeInsets.all(3),
      height: 60.h,
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        top: 12.h,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: primaryClr, width: 1.87.w),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (title == addPropertyCubit.propertyStatus ||
                  title == addPropertyCubit.propertyCategory ||
                  title == addPropertyCubit.payment)
              ? const CustomRadioButton()
              : const SizedBox(width: 17, height: 17),
          const SizedBox(width: 14),
          Text(title, style: getStyleBold16(context)),
        ],
      ),
    );
  }
}

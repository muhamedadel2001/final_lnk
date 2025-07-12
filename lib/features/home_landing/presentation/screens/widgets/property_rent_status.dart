import 'package:final_lnk/core/util/const_controllers.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'colored_option_box.dart';

class PropertyRentStatus extends StatelessWidget {
  const PropertyRentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeLandingCubit addPropertyCubit = BlocProvider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.rent,
          style: getStyleBold13(context).copyWith(fontSize: 16.sp),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ColoredOptionBox(
                isSelected:
                    addPropertyCubit.userSelection.typeOfRentId ==
                    addPropertyCubit.typeOfRentModel!.typeOfRents![0].id,
                onTap: () {
                  addPropertyCubit.userSelection.typeOfRentId =
                      addPropertyCubit.typeOfRentModel!.typeOfRents![0].id;
                  addPropertyCubit.changeValue();
                },

                title: addPropertyCubit.typeOfRentModel!.typeOfRents![0].name!,
              ),
            ),
            SizedBox(width: 35.w),
            Expanded(
              child: ColoredOptionBox(
                isSelected:
                    addPropertyCubit.userSelection.typeOfRentId ==
                    addPropertyCubit.typeOfRentModel!.typeOfRents![1].id,
                onTap: () {
                  addPropertyCubit.userSelection.typeOfRentId =
                      addPropertyCubit.typeOfRentModel!.typeOfRents![1].id;
                  addPropertyCubit.changeValue();
                },
                title: addPropertyCubit.typeOfRentModel!.typeOfRents![1].name!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Text(
          LangKeys.price,
          style: getStyleBold13(context).copyWith(fontSize: 16.sp),
        ),
        const SizedBox(height: 10),
        addPropertyCubit.isRequest
            ? Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    hintText: LangKeys.from,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: CustomTextField(
                    controller: insuranceOrDownController,
                    keyboardType: TextInputType.number,
                    hintText: LangKeys.to,
                  ),
                ),
              ],
            )
            : Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
        const SizedBox(height: 22),
        addPropertyCubit.isRequest
            ? SizedBox.shrink()
            : Text(
              LangKeys.insurance,
              style: getStyleBold13(context).copyWith(fontSize: 16.sp),
            ),
        const SizedBox(height: 10),
        addPropertyCubit.isRequest
            ? SizedBox.shrink()
            : Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: insuranceOrDownController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
      ],
    );
  }
}

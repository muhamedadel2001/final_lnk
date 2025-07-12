import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/circle_nom_box.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class InstallmentOptions extends StatefulWidget {
  final TextEditingController? insuranceOrDownController;
  const InstallmentOptions({super.key, this.insuranceOrDownController});

  @override
  State<InstallmentOptions> createState() => _InstallmentOptionsState();
}

class _InstallmentOptionsState extends State<InstallmentOptions> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Text(
          LangKeys.downPayment,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: widget.insuranceOrDownController!,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Text(
          LangKeys.installmentYears,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        FittedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '1';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 1,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '1',
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '2';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 2,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '2',
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '3';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 3,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '3',
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '4';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 4,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '4',
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '5';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 5,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '5',
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.userSelection.installmentYears = '6';
                  addPropertyCubit.changeValue();
                },
                child: CircleNomBox(
                  title: 6,
                  isSelected:
                      addPropertyCubit.userSelection.installmentYears == '6',
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}

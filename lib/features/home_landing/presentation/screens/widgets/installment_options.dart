import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/circle_nom_box.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class InstallmentOptions extends StatefulWidget {
  const InstallmentOptions({super.key});

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
          'down payment',
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: addPropertyCubit.downPayment,
          hintText: 'enter price',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Text(
          'installments years',
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        FittedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 1;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 1,
                  isSelected: addPropertyCubit.installmentYears == 1,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 2;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 2,
                  isSelected: addPropertyCubit.installmentYears == 2,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 3;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 3,
                  isSelected: addPropertyCubit.installmentYears == 3,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 4;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 4,
                  isSelected: addPropertyCubit.installmentYears == 4,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 5;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 5,
                  isSelected: addPropertyCubit.installmentYears == 5,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  addPropertyCubit.installmentYears = 6;
                  setState(() {});
                },
                child: CircleNomBox(
                  title: 6,
                  isSelected: addPropertyCubit.installmentYears == 6,
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

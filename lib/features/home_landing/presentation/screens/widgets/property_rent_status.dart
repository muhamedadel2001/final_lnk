import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        Text('type of rent', style: getStyleBold13(context)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: ColoredOptionBox(title: ' Daily')),
            const SizedBox(width: 26),
            Expanded(child: ColoredOptionBox(title: 'Monthly')),
          ],
        ),
        const SizedBox(height: 22),
        Text('monthly_rent_Range', style: getStyleBold13(context)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                hintText: '500.00',
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        Text('insurance', style: getStyleBold13(context)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: addPropertyCubit.insurance,
                keyboardType: TextInputType.number,
                hintText: '500.0',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/payment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class SellView extends StatelessWidget {
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'price',
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        addPropertyCubit.isRequest
            ? Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: addPropertyCubit.price,
                    hintText: 'from',
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 25.w),
                Expanded(
                  child: CustomTextField(
                    controller: addPropertyCubit.price,
                    hintText: 'to',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            )
            : CustomTextField(
              controller: addPropertyCubit.price,
              hintText: 'enter price',
              keyboardType: TextInputType.number,
            ),
        const SizedBox(height: 14),
        Text(
          'payment',
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        const PaymentOptions(),
      ],
    );
  }
}

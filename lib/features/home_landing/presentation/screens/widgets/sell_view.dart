import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/payment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class SellView extends StatelessWidget {
  final TextEditingController priceController;
  final TextEditingController? insuranceOrDownController;
  const SellView({
    super.key,
    required this.priceController,
    this.insuranceOrDownController,
  });

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.price,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
        const SizedBox(height: 14),
        Text(
          LangKeys.paymentMethod,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        PaymentOptions(insuranceOrDownController: insuranceOrDownController),
      ],
    );
  }
}

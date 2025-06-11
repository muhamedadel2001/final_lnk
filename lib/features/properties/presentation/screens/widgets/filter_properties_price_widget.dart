import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/fonts.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class FilterPropertiesPriceWidget extends StatelessWidget {
  final TextEditingController fromPriceController;
  final TextEditingController toPriceController;
  const FilterPropertiesPriceWidget({
    super.key,
    required this.fromPriceController,
    required this.toPriceController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LangKeys.price,
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: LangKeys.from,
                controller: fromPriceController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 35.w),
            Expanded(
              child: CustomTextField(
                controller: toPriceController,
                hintText: LangKeys.to,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/fonts.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/properties_cubit.dart';

class FilterPropertiesAreaWidget extends StatelessWidget {
  const FilterPropertiesAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final propCubit = BlocProvider.of<PropertiesCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'area',
          style: getStyle20(
            context,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: propCubit.area,
                hintText: 'from',
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 35.w),
            Expanded(
              child: CustomTextField(
                controller: propCubit.area,
                hintText: 'to',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

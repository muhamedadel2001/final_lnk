import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/fonts.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class FilterRequestsAreaWidget extends StatelessWidget {
  const FilterRequestsAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final reqCubit = BlocProvider.of<RequestsCubit>(context);

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
                controller: reqCubit.area,
                hintText: 'from',
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 35.w),
            Expanded(
              child: CustomTextField(
                controller: reqCubit.area,
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

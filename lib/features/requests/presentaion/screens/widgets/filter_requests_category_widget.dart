import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_requests_option_box_widget.dart';

class FilterRequestsCategoryWidget extends StatefulWidget {
  const FilterRequestsCategoryWidget({super.key});

  @override
  State<FilterRequestsCategoryWidget> createState() =>
      _FilterRequestsCategoryWidgetState();
}

class _FilterRequestsCategoryWidgetState
    extends State<FilterRequestsCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final reqCubit = BlocProvider.of<RequestsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            GestureDetector(
              onTap:
                  () => reqCubit.changePropertyCategory(LangKeys.residential),
              child: FilterRequestsOptionBoxWidget(title: LangKeys.residential),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () => reqCubit.changePropertyCategory(LangKeys.commercial),
              child: FilterRequestsOptionBoxWidget(title: LangKeys.commercial),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () => reqCubit.changePropertyCategory(LangKeys.coastal),
              child: FilterRequestsOptionBoxWidget(title: LangKeys.coastal),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

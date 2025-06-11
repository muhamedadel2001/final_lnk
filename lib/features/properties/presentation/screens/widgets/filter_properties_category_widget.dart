import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home_landing/presentation/screens/widgets/option_box.dart';
import '../../manager/properties_cubit.dart';
import 'filter_property_option_box_widget.dart';

class FilterPropertiesCategoryWidget extends StatefulWidget {
  const FilterPropertiesCategoryWidget({super.key});

  @override
  State<FilterPropertiesCategoryWidget> createState() =>
      _FilterPropertiesCategoryWidgetState();
}

class _FilterPropertiesCategoryWidgetState
    extends State<FilterPropertiesCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final propCubit = BlocProvider.of<PropertiesCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            GestureDetector(
              onTap:
                  () => propCubit.changePropertyCategory(LangKeys.residential),
              child: FilterPropertiesOptionBoxWidget(
                title: LangKeys.residential,
              ),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap:
                  () => propCubit.changePropertyCategory(LangKeys.commercial),
              child: FilterPropertiesOptionBoxWidget(
                title: LangKeys.commercial,
              ),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () => propCubit.changePropertyCategory(LangKeys.coastal),
              child: FilterPropertiesOptionBoxWidget(title: LangKeys.coastal),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

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
              onTap: () {
                propCubit.propertyCategory = 'residential';
                setState(() {});
              },
              child: FilterPropertiesOptionBoxWidget(title: 'Residential'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                propCubit.propertyCategory = 'commercial';
                setState(() {});
              },
              child: FilterPropertiesOptionBoxWidget(title: 'Commercial'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                propCubit.propertyCategory = 'costal';
                setState(() {});
              },
              child: FilterPropertiesOptionBoxWidget(title: 'Coastal'),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

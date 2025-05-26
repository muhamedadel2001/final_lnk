import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_types_gird_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'option_box.dart';

class PropertyCategory extends StatefulWidget {
  const PropertyCategory({super.key});

  @override
  State<PropertyCategory> createState() => _PropertyCategoryState();
}

class _PropertyCategoryState extends State<PropertyCategory> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            GestureDetector(
              onTap: () {
                addPropertyCubit.propertyCategory = 'residential';
                setState(() {});
              },
              child: OptionBox(title: 'Residential'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                addPropertyCubit.propertyCategory = 'commercial';
                setState(() {});
              },
              child: OptionBox(title: 'Commercial'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                addPropertyCubit.propertyCategory = 'costal';
                setState(() {});
              },
              child: OptionBox(title: 'Coastal'),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const PropertyTypesGirdView(),
        SizedBox(height: 10.h),
      ],
    );
  }
}

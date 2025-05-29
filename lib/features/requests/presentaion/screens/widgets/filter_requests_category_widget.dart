import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../properties/presentation/screens/widgets/filter_property_option_box_widget.dart';
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
              onTap: () {
                reqCubit.propertyCategory = 'residential';
                setState(() {});
              },
              child: FilterRequestsOptionBoxWidget(title: 'Residential'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                reqCubit.propertyCategory = 'commercial';
                setState(() {});
              },
              child: FilterRequestsOptionBoxWidget(title: 'Commercial'),
            ),
            const SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                reqCubit.propertyCategory = 'costal';
                setState(() {});
              },
              child: FilterRequestsOptionBoxWidget(title: 'Coastal'),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

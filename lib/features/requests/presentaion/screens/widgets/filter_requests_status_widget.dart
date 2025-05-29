import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_property_option_box_widget.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home_landing/presentation/screens/widgets/option_box.dart';
import 'filter_requests_option_box_widget.dart';

class FilterRequestsStatusWidget extends StatefulWidget {
  const FilterRequestsStatusWidget({super.key});

  @override
  State<FilterRequestsStatusWidget> createState() =>
      _FilterRequestsStatusWidgetState();
}

class _FilterRequestsStatusWidgetState
    extends State<FilterRequestsStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final reqCubit = BlocProvider.of<RequestsCubit>(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            reqCubit.propertyStatus = 'Sell';
            //    rentChangesCubit.generateCashChanges();
            setState(() {});
          },
          child: FilterRequestsOptionBoxWidget(title: 'Sell'),
        ),
        const SizedBox(width: 11),
        GestureDetector(
          onTap: () {
            reqCubit.propertyStatus = 'Rent';
            //   rentChangesCubit.generateRentChanges();
            setState(() {});
          },
          child: FilterRequestsOptionBoxWidget(title: 'Rent'),
        ),
      ],
    );
  }
}

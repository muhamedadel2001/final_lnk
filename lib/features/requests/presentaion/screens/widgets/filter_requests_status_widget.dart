import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/lang_keys.dart';
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
            reqCubit.userSelection.typeOfRentId = null;
            reqCubit.changePropertyStatus(LangKeys.sale);
          },
          child: FilterRequestsOptionBoxWidget(title: LangKeys.sale),
        ),
        const SizedBox(width: 11),
        GestureDetector(
          onTap: () => reqCubit.changePropertyStatus(LangKeys.rent),
          child: FilterRequestsOptionBoxWidget(title: LangKeys.rent),
        ),
      ],
    );
  }
}

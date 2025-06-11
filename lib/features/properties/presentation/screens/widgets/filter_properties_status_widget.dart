import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_property_option_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/lang_keys.dart';
import '../../../../home_landing/presentation/screens/widgets/option_box.dart';

class FilterPropertiesStatusWidget extends StatefulWidget {
  const FilterPropertiesStatusWidget({super.key});

  @override
  State<FilterPropertiesStatusWidget> createState() =>
      _FilterPropertiesStatusWidgetState();
}

class _FilterPropertiesStatusWidgetState
    extends State<FilterPropertiesStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final propCubit = BlocProvider.of<PropertiesCubit>(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () => propCubit.changePropertyStatus(LangKeys.sale),
          child: FilterPropertiesOptionBoxWidget(title: LangKeys.sale),
        ),
        const SizedBox(width: 11),
        GestureDetector(
          onTap: () => propCubit.changePropertyStatus(LangKeys.rent),
          child: FilterPropertiesOptionBoxWidget(title: LangKeys.rent),
        ),
      ],
    );
  }
}

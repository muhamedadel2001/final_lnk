import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/lang_keys.dart';
import 'option_box.dart';

class PropertyStatus extends StatefulWidget {
  const PropertyStatus({super.key});
  @override
  State<PropertyStatus> createState() => _PropertyStatusState();
}

class _PropertyStatusState extends State<PropertyStatus> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            addPropertyCubit.userSelection.typeOfRentId = null;
            addPropertyCubit.changePropertyStatus(LangKeys.sale);
          },
          child: OptionBox(title: LangKeys.sale),
        ),
        const SizedBox(width: 11),
        GestureDetector(
          onTap: () => addPropertyCubit.changePropertyStatus(LangKeys.rent),
          child: OptionBox(title: LangKeys.rent),
        ),
      ],
    );
  }
}

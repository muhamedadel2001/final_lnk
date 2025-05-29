import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/logic/manual_localization.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/util/fonts.dart';
import '../../../../home_landing/presentation/screens/widgets/custom_radio_button.dart';

class FilterPropertiesOptionBoxWidget extends StatelessWidget {
  final String title;
  const FilterPropertiesOptionBoxWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final propCubit = BlocProvider.of<PropertiesCubit>(context);
    return Container(
      margin: const EdgeInsets.all(3),
      height: 50,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: primaryClr, width: 1.87),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (title == propCubit.propertyStatus ||
                  ManualLocalization.getPropertyCategoryEnglishWord(title) ==
                      propCubit.propertyCategory)
              ? const CustomRadioButton()
              : const SizedBox(width: 17, height: 17),
          const SizedBox(width: 14),
          Text(title, style: getStyleBold16(context)),
        ],
      ),
    );
  }
}

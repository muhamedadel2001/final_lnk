import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/expression_validator.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/custom_drop_down_button.dart';
import 'nom_box.dart';

class NomBalacons extends StatefulWidget {
  const NomBalacons({super.key});

  @override
  State<NomBalacons> createState() => _NomBalaconsState();
}

class _NomBalaconsState extends State<NomBalacons> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            addPropertyCubit.userSelection.balaconsNom = '1';
            addPropertyCubit.changeValue();
          },
          child: NomBox(
            title: '1',
            isSelected: ExpressionValidator.nomEqualString(
              int.parse(addPropertyCubit.userSelection.balaconsNom),
              '1',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.userSelection.balaconsNom = '2';
            addPropertyCubit.changeValue();
          },
          child: NomBox(
            title: '2',
            isSelected: ExpressionValidator.nomEqualString(
              int.parse(addPropertyCubit.userSelection.balaconsNom),
              '2',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.userSelection.balaconsNom = '3';
            addPropertyCubit.changeValue();
          },
          child: NomBox(
            title: '3',
            isSelected: ExpressionValidator.nomEqualString(
              int.parse(addPropertyCubit.userSelection.balaconsNom),
              '3',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.userSelection.balaconsNom = '4';
            addPropertyCubit.changeValue();
          },
          child: NomBox(
            title: '4',
            isSelected: ExpressionValidator.nomEqualString(
              int.parse(addPropertyCubit.userSelection.balaconsNom),
              '4',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 150),
            width: 80.w,
            child: CustomDropDownButton(
              dropDownList: List.generate(16, (nom) {
                return (nom + 5).toString();
              }),
              callBack: (val) {
                addPropertyCubit.changeValue();
                if (val == null) return;
                addPropertyCubit.userSelection.balaconsNom = val;
              },
              fillColor:
                  ((int.parse(addPropertyCubit.userSelection.balaconsNom)) > 4)
                      ? primaryClr
                      : backgroundClr,
              hintText: LangKeys.more,
              hintStyle: getStyleBold16(
                context,
              ).copyWith(color: textSecondaryClr, height: 1.7),
              dropIcon: Icons.arrow_circle_down_sharp,
              iconColor:
                  ((int.parse(addPropertyCubit.userSelection.balaconsNom)) > 4)
                      ? backgroundClr
                      : textSecondaryClr,
              title: '',
            ),
          ),
        ),
      ],
    );
  }
}

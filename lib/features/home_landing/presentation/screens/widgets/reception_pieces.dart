import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/expression_validator.dart';
import '../../../../../core/util/colors.dart';
import '../../../../../core/widgets/custom_drop_down_button.dart';
import 'nom_box.dart';

class ReceptionPieces extends StatefulWidget {
  const ReceptionPieces({super.key});

  @override
  State<ReceptionPieces> createState() => _ReceptionPiecesState();
}

class _ReceptionPiecesState extends State<ReceptionPieces> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            addPropertyCubit.receptionPieces = 1;
            setState(() {});
          },
          child: NomBox(
            title: '1',
            isSelected: ExpressionValidator.nomEqualString(
              addPropertyCubit.receptionPieces,
              '1',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.receptionPieces = 2;
            setState(() {});
          },
          child: NomBox(
            title: '2',
            isSelected: ExpressionValidator.nomEqualString(
              addPropertyCubit.receptionPieces,
              '2',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.receptionPieces = 3;
            setState(() {});
          },
          child: NomBox(
            title: '3',
            isSelected: ExpressionValidator.nomEqualString(
              addPropertyCubit.receptionPieces,
              '3',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            addPropertyCubit.receptionPieces = 4;
            setState(() {});
          },
          child: NomBox(
            title: '4',
            isSelected: ExpressionValidator.nomEqualString(
              addPropertyCubit.receptionPieces,
              '4',
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 150),
            width: 100,
            child: CustomDropDownButton(
              dropDownList: List.generate(16, (nom) {
                if (nom + 5 == 20) return '+${nom + 5}';

                return (nom + 5).toString();
              }),
              callBack: (val) {
                if (val == null) return;
                addPropertyCubit.receptionPieces = int.parse(val);
                setState(() {});
              },
              fillColor:
                  ((addPropertyCubit.receptionPieces) > 4)
                      ? primaryClr
                      : backgroundClr,
              hintText: 'More',
              hintStyle: getStyleBold16(
                context,
              ).copyWith(color: textSecondaryClr, height: 1.7),
              dropIcon: Icons.arrow_circle_down_sharp,
              iconColor:
                  ((addPropertyCubit.receptionPieces) > 4)
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

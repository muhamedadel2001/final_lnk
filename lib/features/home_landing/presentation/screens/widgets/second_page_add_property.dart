import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_rent_status.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/reception_pieces.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/sell_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_drop_down_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'balacons_nom.dart';
import 'bathrooms_nom.dart';
import 'footer.dart';
import 'nom_rooms.dart';

class SecondPageAddProperty extends StatelessWidget {
  const SecondPageAddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation: 0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('property info', style: getStyle20(context)),
                const SizedBox(height: 23),
                Text(
                  'floor',
                  style: getStyle20(
                    context,
                  ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                CustomDropDownButton(
                  value: addPropertyCubit.floorNom.toString(),
                  dropDownList: List.generate(101, (val) => val.toString()),
                  callBack: (dynamic newValue) {
                    if (newValue == null) return;
                    addPropertyCubit.floorNom = int.parse(newValue);
                  },
                  hintText: 'select',
                ),
                const SizedBox(height: 14),
                Text(
                  'area',
                  style: getStyle20(
                    context,
                  ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                CustomTextField(
                  controller: addPropertyCubit.areaByMeter,
                  suffixText: 'meter',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                addPropertyCubit.propertyCategory == 'commercial'
                    ? SizedBox.shrink()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'rooms',
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        const NomRooms(),
                        const SizedBox(height: 14),
                        Text(
                          'bathrooms',
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        const NomBathrooms(),
                        const SizedBox(height: 14),
                        Text(
                          'balacons',
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        const NomBalacons(),
                        const SizedBox(height: 14),
                        Text(
                          'reception Pieces',
                          style: getStyle20(
                            context,
                          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        const ReceptionPieces(),
                      ],
                    ),
                const SizedBox(height: 14),
                Text(
                  'finishing',
                  style: getStyle20(
                    context,
                  ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                CustomDropDownButton(
                  dropDownList: [],
                  callBack: (dynamic newValue) {
                    if (newValue == null) return;
                    addPropertyCubit.finishing = newValue;
                  },
                  hintText: 'select',
                  title: '',
                ),
                const SizedBox(height: 14),
                Text(
                  'furnishing',
                  style: getStyle20(
                    context,
                  ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                CustomDropDownButton(
                  dropDownList: [],
                  callBack: (dynamic newValue) {
                    if (newValue == null) return;
                    addPropertyCubit.furnishing = newValue;
                  },
                  hintText: 'select',
                ),
                const SizedBox(height: 14),
                // SellView(),
                PropertyRentStatus(),
                SizedBox(height: 20.h),
                const Footer(pageNom: 2),
                const SizedBox(height: 19),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

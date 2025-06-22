import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_rent_status.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/reception_pieces.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/sell_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/logic/get_inputs_list.dart';
import '../../../../../core/util/const.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/titled_custom_drop_down_button.dart';
import 'balacons_nom.dart';
import 'bathrooms_nom.dart';
import 'footer.dart';
import 'nom_rooms.dart';

class SecondPageAddProperty extends StatefulWidget {
  const SecondPageAddProperty({super.key});

  @override
  State<SecondPageAddProperty> createState() => _SecondPageAddPropertyState();
}

class _SecondPageAddPropertyState extends State<SecondPageAddProperty> {
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
            child: BlocBuilder<HomeLandingCubit, HomeLandingState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LangKeys.propertyInfo, style: getStyle20(context)),
                    SizedBox(height: 20.h),
                    TitledCustomDropDownButton(
                      value: addPropertyCubit.userSelection.floorNom,
                      title: LangKeys.floor,
                      callBack: (val) {
                        addPropertyCubit.userSelection.floorNom = val;
                        print(addPropertyCubit.userSelection.floorNom);
                      },
                      dropDownList: List.generate(25, (val) => val.toString()),
                      hintText: LangKeys.select,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      LangKeys.area,
                      style: getStyle20(
                        context,
                      ).copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: areaController,
                      suffixText: LangKeys.meter,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    addPropertyCubit.propertyCategory == LangKeys.commercial
                        ? SizedBox.shrink()
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LangKeys.rooms,
                              style: getStyle20(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            NomRooms(),
                            const SizedBox(height: 14),
                            Text(
                              LangKeys.bathrooms,
                              style: getStyle20(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            NomBathrooms(),
                            const SizedBox(height: 14),
                            Text(
                              LangKeys.balcony,
                              style: getStyle20(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            NomBalacons(),
                            const SizedBox(height: 14),
                            Text(
                              LangKeys.reception,
                              style: getStyle20(context).copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ReceptionPieces(),
                          ],
                        ),
                    const SizedBox(height: 14),
                    TitledCustomDropDownButton(
                      value: addPropertyCubit.userSelection.finishing,
                      title: LangKeys.finishingType,
                      callBack: (val) async {
                        int index = GetLists.getFinishingNames(
                          addPropertyCubit.appModel,
                        ).indexOf(val);
                        addPropertyCubit.userSelection.finishingId =
                            GetLists.getFinishingIds(
                              addPropertyCubit.appModel,
                            )[index];
                        addPropertyCubit.userSelection.finishing = val;
                      },
                      dropDownList: GetLists.getFinishingNames(
                        addPropertyCubit.appModel,
                      ),
                      hintText: LangKeys.select,
                    ),
                    const SizedBox(height: 14),
                    TitledCustomDropDownButton(
                      value: addPropertyCubit.userSelection.furnishing,
                      title: LangKeys.furnishing,
                      callBack: (val) async {
                        int index = GetLists.getFurnishingNames(
                          addPropertyCubit.appModel,
                        ).indexOf(val);
                        addPropertyCubit.userSelection.furnishingId =
                            GetLists.getFurnishingIds(
                              addPropertyCubit.appModel,
                            )[index];
                        addPropertyCubit.userSelection.furnishing = val;
                      },
                      dropDownList: GetLists.getFurnishingNames(
                        addPropertyCubit.appModel,
                      ),
                      hintText: LangKeys.select,
                    ),
                    const SizedBox(height: 14),
                    addPropertyCubit.propertyStatus == LangKeys.sale
                        ? SellView(
                          priceController: priceController,
                          insuranceOrDownController: insuranceOrDownController,
                        )
                        : PropertyRentStatus(),
                    SizedBox(height: 20.h),
                    Footer(
                      pageNom: 2,
                      callBack: () {
                        Validations.checkSecondCreate(
                          addPropertyCubit,
                          context,
                        );
                      },
                    ),
                    const SizedBox(height: 19),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

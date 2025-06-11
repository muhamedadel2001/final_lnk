import 'dart:io';

import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:final_lnk/features/properties/presentation/manager/properties_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_area_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_category_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_price_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/get_inputs_list.dart';
import '../../../../core/util/fonts.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../../core/widgets/titled_custom_drop_down_button.dart';
import '../../../home_landing/presentation/screens/widgets/colored_option_box.dart';

class FilterPropertiesScreen extends StatefulWidget {
  const FilterPropertiesScreen({super.key});
  @override
  State<FilterPropertiesScreen> createState() => _FilterPropertiesScreenState();
}

class _FilterPropertiesScreenState extends State<FilterPropertiesScreen> {
  late TextEditingController fromPriceController;
  late TextEditingController toPriceController;
  late TextEditingController fromAreaController;
  late TextEditingController toAreaController;
  @override
  void initState() {
    fromPriceController = TextEditingController();
    toPriceController = TextEditingController();
    fromAreaController = TextEditingController();
    toAreaController = TextEditingController();
    PropertiesCubit.get(context).getAllInputsPropertiesFilter(
      lang: MyCache.getString(key: MyCacheKeys.language),
    );
    super.initState();
  }

  @override
  void dispose() {
    fromPriceController.dispose();
    toPriceController.dispose();
    fromAreaController.dispose();
    toAreaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final propCubit = BlocProvider.of<PropertiesCubit>(context);
    print(int.parse('1000000'));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation: 0),
        body: BlocBuilder<PropertiesCubit, PropertiesState>(
          builder: (context, state) {
            return state is GetInputsLoading
                ? Center(
                  child:
                      Platform.isIOS
                          ? CupertinoActivityIndicator(color: primaryClr)
                          : CircularProgressIndicator(color: primaryClr),
                )
                : state is GetInputsFailure
                ? Center(
                  child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
                )
                : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LangKeys.type, style: getStyle20(context)),
                        SizedBox(height: 10.h),
                        FilterPropertiesStatusWidget(),
                        SizedBox(height: 10.h),
                        Text(LangKeys.category, style: getStyle20(context)),
                        SizedBox(height: 10.h),
                        FilterPropertiesCategoryWidget(),
                        TitledCustomDropDownButton(
                          value: propCubit.userSelection.city,
                          title: LangKeys.city,
                          callBack: (val) async {
                            int index = GetLists.getCityNames(
                              propCubit.appModel,
                            ).indexOf(val);
                            propCubit.userSelection.cityId =
                                GetLists.getCityIds(propCubit.appModel)[index];
                            propCubit.userSelection.city = val;
                            propCubit.userSelection.area = null;
                            propCubit.userSelection.areaId = null;
                            propCubit.appModel.areasModel = null;
                            if (propCubit.userSelection.cityId != null) {
                              await propCubit.getAreas(
                                lang: MyCache.getString(
                                  key: MyCacheKeys.language,
                                ),
                                id: propCubit.userSelection.cityId!,
                              );
                            }
                          },
                          dropDownList: GetLists.getCityNames(
                            propCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        const SizedBox(height: 12),
                        TitledCustomDropDownButton(
                          value: propCubit.userSelection.area,
                          title: LangKeys.location,
                          callBack: (val) {
                            int index = GetLists.getAreasNames(
                              propCubit.appModel,
                            ).indexOf(val);
                            propCubit.userSelection.area = val;
                            propCubit.userSelection.areaId =
                                GetLists.getAreasId(propCubit.appModel)[index];
                            propCubit.changeValue();
                          },
                          dropDownList: GetLists.getAreasNames(
                            propCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        SizedBox(height: 10.h),
                        TitledCustomDropDownButton(
                          value: propCubit.userSelection.finishing,
                          title: LangKeys.finishingType,
                          callBack: (val) async {
                            int index = GetLists.getFinishingNames(
                              propCubit.appModel,
                            ).indexOf(val);
                            propCubit.userSelection.finishingId =
                                GetLists.getFinishingIds(
                                  propCubit.appModel,
                                )[index];
                            propCubit.userSelection.finishing = val;
                          },
                          dropDownList: GetLists.getFinishingNames(
                            propCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        SizedBox(height: 10.h),
                        propCubit.propertyStatus == LangKeys.rent
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LangKeys.rent,
                                  style: getStyleBold13(context),
                                ),

                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ColoredOptionBox(
                                        isSelected:
                                            propCubit
                                                .userSelection
                                                .typeOfRentId ==
                                            propCubit
                                                .typeOfRentModel!
                                                .typeOfRents![0]
                                                .id,
                                        onTap: () {
                                          propCubit.userSelection.typeOfRentId =
                                              propCubit
                                                  .typeOfRentModel!
                                                  .typeOfRents![0]
                                                  .id;
                                          propCubit.changeValue();
                                        },

                                        title:
                                            propCubit
                                                .typeOfRentModel!
                                                .typeOfRents![0]
                                                .name!,
                                      ),
                                    ),
                                    SizedBox(width: 35.w),
                                    Expanded(
                                      child: ColoredOptionBox(
                                        isSelected:
                                            propCubit
                                                .userSelection
                                                .typeOfRentId ==
                                            propCubit
                                                .typeOfRentModel!
                                                .typeOfRents![1]
                                                .id,
                                        onTap: () {
                                          propCubit.userSelection.typeOfRentId =
                                              propCubit
                                                  .typeOfRentModel!
                                                  .typeOfRents![1]
                                                  .id;
                                          propCubit.changeValue();
                                        },
                                        title:
                                            propCubit
                                                .typeOfRentModel!
                                                .typeOfRents![1]
                                                .name!,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                            : SizedBox.shrink(),
                        SizedBox(height: 10.h),
                        FilterPropertiesAreaWidget(
                          fromAreaController: fromAreaController,
                          toAreaController: toAreaController,
                        ),
                        SizedBox(height: 10.h),
                        FilterPropertiesPriceWidget(
                          fromPriceController: fromPriceController,
                          toPriceController: toPriceController,
                        ),
                        SizedBox(height: 25.h),

                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                callBack: () {
                                  Navigator.pop(context);
                                },
                                text: 'Reset',
                                style: getStyle20(
                                  context,
                                ).copyWith(fontSize: 16.sp, color: primaryClr),
                                backgroundClr: Colors.white,
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Expanded(
                              child: PrimaryButton(
                                callBack: () {
                                  Navigator.pushNamed(
                                    context,
                                    resultFilterPropertiesScreen,
                                    arguments: {
                                      'propertiesCubit': propCubit,
                                      'minArea': fromAreaController.text,
                                      'maxArea': toAreaController.text,
                                      'minPrice': fromPriceController.text,
                                      'maxPrice': toPriceController.text,
                                    },
                                  );
                                },
                                text: 'Apply filter',
                                style: getStyle20(
                                  context,
                                ).copyWith(fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}

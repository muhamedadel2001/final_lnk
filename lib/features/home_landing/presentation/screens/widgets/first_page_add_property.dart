import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_category.dart';
import 'package:final_lnk/features/home_landing/presentation/screens/widgets/property_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/logic/custom_alerts.dart';
import '../../../../../core/logic/get_inputs_list.dart';
import '../../../../../core/util/lang_keys.dart';
import '../../../../../core/widgets/titled_custom_drop_down_button.dart';
import 'footer.dart';

class FirstPageAddProperty extends StatefulWidget {
  const FirstPageAddProperty({super.key});

  @override
  State<FirstPageAddProperty> createState() => _FirstPageAddPropertyState();
}

class _FirstPageAddPropertyState extends State<FirstPageAddProperty> {
  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    insuranceOrDownController = TextEditingController();
    priceController = TextEditingController();
    areaController = TextEditingController();
    phoneController = TextEditingController();
    whatsController = TextEditingController();
    HomeLandingCubit.get(context).getAllInputsPropertiesFilter(
      lang: MyCache.getString(key: MyCacheKeys.language),
    );
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    insuranceOrDownController.dispose();
    priceController.dispose();
    areaController.dispose();
    phoneController.dispose();
    whatsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          addPropertyCubit.imageFiles = [];
          addPropertyCubit.isRequest = false;
          addPropertyCubit.isShowingAllPropertyTypes = false;
          addPropertyCubit.propertyCategory = LangKeys.residential;
          addPropertyCubit.propertyStatus = LangKeys.sale;
          addPropertyCubit.payment = LangKeys.cash;
          addPropertyCubit.propertyType = '';
          addPropertyCubit.userSelection.resetData();
        }
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
                    Text(LangKeys.type, style: getStyle20(context)),
                    SizedBox(height: 10.h),
                    PropertyStatus(),
                    SizedBox(height: 20.h),
                    Text(LangKeys.category, style: getStyle20(context)),
                    SizedBox(height: 10.h),
                    PropertyCategory(),
                    TitledCustomDropDownButton(
                      value: addPropertyCubit.userSelection.city,
                      title: LangKeys.city,
                      callBack: (val) async {
                        int index = GetLists.getCityNames(
                          addPropertyCubit.appModel,
                        ).indexOf(val);
                        addPropertyCubit.userSelection.cityId =
                            GetLists.getCityIds(
                              addPropertyCubit.appModel,
                            )[index];
                        addPropertyCubit.userSelection.city = val;
                        addPropertyCubit.userSelection.area = null;
                        addPropertyCubit.userSelection.areaId = null;
                        addPropertyCubit.appModel.areasModel = null;
                        if (addPropertyCubit.userSelection.cityId != null) {
                          await addPropertyCubit.getAreas(
                            lang: MyCache.getString(key: MyCacheKeys.language),
                            id: addPropertyCubit.userSelection.cityId!,
                          );
                        }
                      },
                      dropDownList: GetLists.getCityNames(
                        addPropertyCubit.appModel,
                      ),
                      hintText: LangKeys.select,
                    ),
                    SizedBox(height: 10.h),
                    TitledCustomDropDownButton(
                      value: addPropertyCubit.userSelection.area,
                      title: LangKeys.location,
                      callBack: (val) {
                        int index = GetLists.getAreasNames(
                          addPropertyCubit.appModel,
                        ).indexOf(val);
                        addPropertyCubit.userSelection.area = val;
                        addPropertyCubit.userSelection.areaId =
                            GetLists.getAreasId(
                              addPropertyCubit.appModel,
                            )[index];
                        addPropertyCubit.changeValue();
                      },
                      dropDownList: GetLists.getAreasNames(
                        addPropertyCubit.appModel,
                      ),
                      hintText: LangKeys.select,
                    ),
                    const SizedBox(height: 28),
                    Footer(
                      pageNom: 1,
                      callBack: () {
                        Validations.checkFirstCreate(addPropertyCubit, context);
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

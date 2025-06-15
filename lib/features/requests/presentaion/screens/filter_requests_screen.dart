import 'dart:io';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_area_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_category_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_price_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/get_inputs_list.dart';
import '../../../../core/util/fonts.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../../core/widgets/titled_custom_drop_down_button.dart';
import '../../../home_landing/presentation/screens/widgets/colored_option_box.dart';

class FilterRequestsScreen extends StatefulWidget {
  const FilterRequestsScreen({super.key});
  @override
  State<FilterRequestsScreen> createState() => _FilterRequestsScreenState();
}

class _FilterRequestsScreenState extends State<FilterRequestsScreen> {
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
    RequestsCubit.get(context).getAllInputsRequestsFilter(
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
    final reqCubit = BlocProvider.of<RequestsCubit>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation: 0),
        body: BlocConsumer<RequestsCubit, RequestsState>(
          listener: (context, state) {
            if (state is GetRequestsFilterDataSuccess) {
              Navigator.pushNamed(
                context,
                resultFilterRequestsScreen,
                arguments: {
                  "homeLandingCubit": HomeLandingCubit.get(context),
                  'requestsCubit': reqCubit,
                  'minArea': fromAreaController.text,
                  'maxArea': toAreaController.text,
                  'minPrice': fromPriceController.text,
                  'maxPrice': toPriceController.text,
                },
              );
            } else if (state is GetRequestsFilterDataFailure) {
              CustomAlerts.showMySnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return state is GetInputsRequestsLoading
                ? Center(
                  child:
                      Platform.isIOS
                          ? CupertinoActivityIndicator(color: primaryClr)
                          : CircularProgressIndicator(color: primaryClr),
                )
                : state is GetInputsRequestsFailure
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
                        FilterRequestsStatusWidget(),
                        SizedBox(height: 10.h),
                        Text(LangKeys.category, style: getStyle20(context)),
                        SizedBox(height: 10.h),
                        FilterRequestsCategoryWidget(),
                        TitledCustomDropDownButton(
                          value: reqCubit.userSelection.city,
                          title: LangKeys.city,
                          callBack: (val) async {
                            int index = GetLists.getCityNames(
                              reqCubit.appModel,
                            ).indexOf(val);
                            reqCubit.userSelection.cityId =
                                GetLists.getCityIds(reqCubit.appModel)[index];
                            reqCubit.userSelection.city = val;
                            reqCubit.userSelection.area = null;
                            reqCubit.userSelection.areaId = null;
                            reqCubit.appModel.areasModel = null;
                            if (reqCubit.userSelection.cityId != null) {
                              await reqCubit.getAreas(
                                lang: MyCache.getString(
                                  key: MyCacheKeys.language,
                                ),
                                id: reqCubit.userSelection.cityId!,
                              );
                            }
                          },
                          dropDownList: GetLists.getCityNames(
                            reqCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        const SizedBox(height: 12),
                        TitledCustomDropDownButton(
                          value: reqCubit.userSelection.area,
                          title: LangKeys.location,
                          callBack: (val) {
                            int index = GetLists.getAreasNames(
                              reqCubit.appModel,
                            ).indexOf(val);
                            reqCubit.userSelection.area = val;
                            reqCubit.userSelection.areaId =
                                GetLists.getAreasId(reqCubit.appModel)[index];
                            reqCubit.changeValue();
                          },
                          dropDownList: GetLists.getAreasNames(
                            reqCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        SizedBox(height: 10.h),
                        TitledCustomDropDownButton(
                          value: reqCubit.userSelection.finishing,
                          title: LangKeys.finishingType,
                          callBack: (val) async {
                            int index = GetLists.getFinishingNames(
                              reqCubit.appModel,
                            ).indexOf(val);
                            reqCubit.userSelection.finishingId =
                                GetLists.getFinishingIds(
                                  reqCubit.appModel,
                                )[index];
                            reqCubit.userSelection.finishing = val;
                          },
                          dropDownList: GetLists.getFinishingNames(
                            reqCubit.appModel,
                          ),
                          hintText: LangKeys.select,
                        ),
                        SizedBox(height: 10.h),
                        reqCubit.propertyStatus == LangKeys.rent
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
                                            reqCubit
                                                .userSelection
                                                .typeOfRentId ==
                                            reqCubit
                                                .typeOfRentModel!
                                                .typeOfRents![0]
                                                .id,
                                        onTap: () {
                                          reqCubit.userSelection.typeOfRentId =
                                              reqCubit
                                                  .typeOfRentModel!
                                                  .typeOfRents![0]
                                                  .id;
                                          reqCubit.changeValue();
                                        },

                                        title:
                                            reqCubit
                                                .typeOfRentModel!
                                                .typeOfRents![0]
                                                .name!,
                                      ),
                                    ),
                                    SizedBox(width: 35.w),
                                    Expanded(
                                      child: ColoredOptionBox(
                                        isSelected:
                                            reqCubit
                                                .userSelection
                                                .typeOfRentId ==
                                            reqCubit
                                                .typeOfRentModel!
                                                .typeOfRents![1]
                                                .id,
                                        onTap: () {
                                          reqCubit.userSelection.typeOfRentId =
                                              reqCubit
                                                  .typeOfRentModel!
                                                  .typeOfRents![1]
                                                  .id;
                                          reqCubit.changeValue();
                                        },
                                        title:
                                            reqCubit
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
                        FilterRequestsAreaWidget(
                          fromAreaController: fromAreaController,
                          toAreaController: toAreaController,
                        ),
                        SizedBox(height: 10.h),
                        FilterRequestsPriceWidget(
                          fromPriceController: fromPriceController,
                          toPriceController: toPriceController,
                        ),
                        SizedBox(height: 25.h),

                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                callBack: () {
                                  reqCubit.userSelection.resetData();
                                  reqCubit.changeValue();
                                },
                                text: LangKeys.reset,
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
                                  RequestsCubit.get(
                                    context,
                                  ).getRequestsFilterData(
                                    type:
                                        RequestsCubit.get(
                                          context,
                                        ).propertyStatus,
                                    typeOfRequest:
                                        RequestsCubit.get(
                                          context,
                                        ).propertyCategory,
                                    lang: MyCache.getString(
                                      key: MyCacheKeys.language,
                                    ),
                                    typeOfRent:
                                        RequestsCubit.get(
                                          context,
                                        ).userSelection.typeOfRentId,
                                    minArea: fromAreaController.text,
                                    maxArea: toAreaController.text,
                                    minPrice: fromPriceController.text,
                                    maxPrice: toPriceController.text,
                                    city:
                                        RequestsCubit.get(
                                          context,
                                        ).userSelection.cityId,
                                    location:
                                        RequestsCubit.get(
                                          context,
                                        ).userSelection.areaId,
                                    finishing:
                                        RequestsCubit.get(
                                          context,
                                        ).userSelection.finishingId,
                                  );
                                },
                                text:
                                    state is GetRequestsFilterDataLoading
                                        ? ".."
                                        : LangKeys.search,
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

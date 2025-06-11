import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_area_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_category_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_price_widget.dart';
import 'package:final_lnk/features/properties/presentation/screens/widgets/filter_properties_status_widget.dart';
import 'package:final_lnk/features/requests/presentaion/manager/requests_cubit.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_area_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_category_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_price_widget.dart';
import 'package:final_lnk/features/requests/presentaion/screens/widgets/filter_requests_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/const.dart';
import '../../../../core/util/fonts.dart';
import '../../../../core/widgets/custom_drop_down_button.dart';
import '../../../home_landing/presentation/screens/widgets/colored_option_box.dart';

class FilterRequestScreen extends StatelessWidget {
  const FilterRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reqCubit = BlocProvider.of<RequestsCubit>(context);
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('request Status', style: getStyle20(context)),
              SizedBox(height: 10.h),
              FilterRequestsStatusWidget(),
              SizedBox(height: 10.h),
              Text('request category', style: getStyle20(context)),
              SizedBox(height: 10.h),
              FilterRequestsCategoryWidget(),
              Text('city', style: getStyle20(context)),
              const SizedBox(height: 19),
              CustomDropDownButton(
                value: reqCubit.city,
                dropDownList: ourCities,
                callBack: (dynamic newValue) {
                  if (newValue == null) return;
                  reqCubit.city = newValue;
                },
                hintText: 'selelct city',
                title: '',
              ),
              const SizedBox(height: 12),
              Text('location', style: getStyle20(context)),
              const SizedBox(height: 19),
              CustomDropDownButton(
                value: reqCubit.city,
                dropDownList: ourCities,
                callBack: (dynamic newValue) {
                  if (newValue == null) return;
                  reqCubit.city = newValue;
                },
                hintText: 'selelct city',
                title: '',
              ),
              SizedBox(height: 10.h),
              Text(
                'finishing',
                style: getStyle20(
                  context,
                ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              CustomDropDownButton(
                dropDownList: [],
                callBack: (dynamic newValue) {
                  if (newValue == null) return;
                  reqCubit.finishing = newValue;
                },
                hintText: 'select',
                title: '',
              ),
              SizedBox(height: 10.h),

              reqCubit.propertyStatus == 'Rent'
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('type of rent', style: getStyleBold13(context)),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ColoredOptionBox(
                              title: ' Daily',
                              isSelected: true,
                              onTap: () {},
                            ),
                          ),
                          SizedBox(width: 35.w),
                          Expanded(
                            child: ColoredOptionBox(
                              title: 'Monthly',
                              isSelected: true,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  : SizedBox.shrink(),
              SizedBox(height: 10.h),
              FilterRequestsAreaWidget(),
              SizedBox(height: 10.h),
              FilterRequestsPriceWidget(),
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
                          resultFilterRequestsScreen,
                          arguments: {
                            'requestsCubit': reqCubit,
                            'homeLandingCubit': HomeLandingCubit.get(context),
                          },
                        );
                      },
                      text: 'Apply filter',
                      style: getStyle20(context).copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}

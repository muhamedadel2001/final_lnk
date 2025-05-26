import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/get_inputs_list.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/const.dart';
import '../../../../core/widgets/check_primary_button.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_drop_down_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';
import '../../data/models/create_freelance_account_model.dart';
import '../manager/auth_cubit.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/selected_service_areas.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class RegisterAgencyScreen extends StatefulWidget {
  const RegisterAgencyScreen({super.key});

  @override
  State<RegisterAgencyScreen> createState() => _RegisterAgencyScreenState();
}

class _RegisterAgencyScreenState extends State<RegisterAgencyScreen> {
  late AuthCubit cubit;
  GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    name = TextEditingController();
    address = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cubit = AuthCubit.get(context);
    cubit.getCities(lang: MyCache.getString(key: MyCacheKeys.language));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    address.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    form.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: backgroundClr,
        centerTitle: true,
        title: Text(LangKeys.createAcc, style: getStyle25(context)),
        bottom: BottomAppBarr(title: LangKeys.agency, widgetHeight: 15),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterError) {
            CustomAlerts.showMySnackBar(context, state.error);
          } else if (state is RegisterSuccess) {
            Navigator.pushNamed(
              context,
              screens.otpScreen,
              arguments: {"cubit": cubit, "isRegister": 'true'},
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: SingleChildScrollView(
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitledCustomTextField(
                      validator: Validations.globalValidation,
                      title: LangKeys.agencyName,
                      controller: name,
                    ),
                    SizedBox(height: 18.h),
                    TitledCustomTextField(
                      validator: Validations.emailValidation,
                      title: LangKeys.email,
                      controller: emailController,
                    ),
                    SizedBox(height: 18.h),
                    TitledCustomTextField(
                      validator: Validations.egyptianPhoneValidation,
                      title: LangKeys.phoneNumber,
                      controller: phoneController,
                    ),
                    SizedBox(height: 18.h),
                    TitledCustomTextField(
                      obsecureText: true,
                      validator: Validations.passwordValidation,
                      title: LangKeys.password,
                      controller: passwordController,
                    ),
                    SizedBox(height: 18.h),
                    TitledCustomTextField(
                      validator: Validations.globalValidation,
                      title: LangKeys.address,
                      controller: address,
                    ),
                    SizedBox(height: 18.h),
                    TitledCustomDropDownButton(
                      value: cubit.userSelection.city,
                      title: LangKeys.city,
                      callBack: (val) {
                        int index = GetLists.getCityNames(
                          cubit.appModel,
                        ).indexOf(val);
                        cubit.userSelection.cityId =
                            GetLists.getCityIds(cubit.appModel)[index];
                        cubit.userSelection.city = val;
                        cubit.changeValue();
                        if (cubit.userSelection.cityId != null) {
                          cubit.getAreas(
                            lang: MyCache.getString(key: MyCacheKeys.language),
                          );
                        }
                      },
                      dropDownList: GetLists.getCityNames(cubit.appModel),
                      hintText: LangKeys.select,
                    ),
                    SizedBox(height: 35.h),
                    cubit.userSelection.cityId != null
                        ? SelectedServiceAreas()
                        : SizedBox(),
                    SizedBox(height: 18.h),
                    cubit.userSelection.serviceAreaId == null
                        ? CheckPrimaryButton(text: LangKeys.continueButton)
                        : cubit.userSelection.serviceAreaId!.isNotEmpty
                        ? PrimaryButton(
                          callBack: () {
                            if (form.currentState!.validate()) {
                              cubit.signup(
                                CreateFreelancAccountModel(
                                  address: address.text,
                                  typeOfUser: cubit.selectedAccountType.name,
                                  password: passwordController.text,
                                  locations: cubit.userSelection.serviceAreaId,
                                  name: name.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  city: cubit.userSelection.cityId,
                                ),
                              );
                            }
                          },
                          text: LangKeys.continueButton,
                        )
                        : CheckPrimaryButton(text: LangKeys.continueButton),
                    SizedBox(height: 35.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

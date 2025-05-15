import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/const.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/validations/validation_helper.dart';
import 'package:final_lnk/core/widgets/check_primary_button.dart';
import 'package:final_lnk/features/auth/data/models/create_freelance_account_model.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/custom_alerts.dart';
import '../../../../core/logic/get_inputs_list.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/titled_custom_drop_down_button.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/selected_service_areas.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class RegisterFreelancerScreen extends StatefulWidget {
  const RegisterFreelancerScreen({super.key});

  @override
  State<RegisterFreelancerScreen> createState() =>
      _RegisterFreelancerScreenState();
}

class _RegisterFreelancerScreenState extends State<RegisterFreelancerScreen> {
  late AuthCubit cubit;
  GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    name = TextEditingController();
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
        bottom: BottomAppBarr(title: LangKeys.freelance, widgetHeight: 15),
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
                      title: LangKeys.fullName,
                      controller: name,
                    ),
                    SizedBox(height: RespCalc().heightRatio(18)),
                    TitledCustomTextField(
                      validator: Validations.emailValidation,
                      title: LangKeys.email,
                      controller: emailController,
                    ),
                    SizedBox(height: RespCalc().heightRatio(18)),
                    TitledCustomTextField(
                      validator: Validations.egyptianPhoneValidation,
                      title: LangKeys.phoneNumber,
                      controller: phoneController,
                    ),
                    SizedBox(height: RespCalc().heightRatio(18)),
                    TitledCustomTextField(
                      validator: Validations.passwordValidation,
                      obsecureText: true,
                      title: LangKeys.password,
                      controller: passwordController,
                    ),
                    SizedBox(height: RespCalc().heightRatio(18)),
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
                    SizedBox(height: RespCalc().heightRatio(35)),
                    cubit.userSelection.cityId != null
                        ? SelectedServiceAreas()
                        : SizedBox(),
                    SizedBox(height: RespCalc().heightRatio(18)),
                    cubit.userSelection.serviceAreaId == null
                        ? CheckPrimaryButton(text: LangKeys.continueButton)
                        : cubit.userSelection.serviceAreaId!.isNotEmpty
                        ? PrimaryButton(
                          callBack: () {
                            if (form.currentState!.validate()) {
                              cubit.signup(
                                CreateFreelancAccountModel(
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
                          text:
                              state is RegisterLoading
                                  ? "..."
                                  : LangKeys.continueButton,
                        )
                        : CheckPrimaryButton(text: LangKeys.continueButton),
                    SizedBox(height: RespCalc().heightRatio(35)),
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

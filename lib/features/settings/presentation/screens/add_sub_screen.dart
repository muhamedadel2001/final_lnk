import 'package:final_lnk/core/logic/custom_alerts.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/widgets/primary_button.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/const.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/validations/validation_helper.dart';
import '../../../../core/widgets/titled_custom_text_field.dart';

class AddSubScreen extends StatefulWidget {
  const AddSubScreen({super.key});

  @override
  State<AddSubScreen> createState() => _AddSubScreenState();
}

class _AddSubScreenState extends State<AddSubScreen> {
  @override
  void initState() {
    nameSubController = TextEditingController();
    phoneSubController = TextEditingController();
    emailSubController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameSubController.dispose();
    phoneSubController.dispose();
    emailSubController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is DeleteSubAccountSuccess) {
          Navigator.pop(context, 'refresh');
        }
        if (state is DeleteSubAccountFailure) {
          CustomAlerts.showMySnackBar(context, state.msg!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LangKeys.addSub, style: getStyleBold16(context)),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  TitledCustomTextField(
                    validator: Validations.globalValidation,
                    title: LangKeys.fullName,
                    controller: nameSubController,
                  ),
                  SizedBox(height: 18.h),
                  TitledCustomTextField(
                    validator: Validations.emailValidation,
                    title: LangKeys.email,
                    controller: emailSubController,
                  ),
                  SizedBox(height: 18.h),
                  TitledCustomTextField(
                    validator: Validations.egyptianPhoneValidation,
                    title: LangKeys.phoneNumber,
                    controller: phoneSubController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 100.h),
                  Center(
                    child: PrimaryButton(
                      callBack: () {
                        Validations.checkForCreateSubAccount(cubit, context);
                      },
                      text:
                          state is DeleteSubAccountLoading
                              ? '...'
                              : LangKeys.add,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

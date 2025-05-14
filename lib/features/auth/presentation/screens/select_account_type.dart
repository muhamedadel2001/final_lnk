import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/widgets/check_primary_button.dart';
import 'package:final_lnk/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/const.dart';
import '../../../../core/widgets/primary_button.dart';

class SelectAccountTypeScreen extends StatelessWidget {
  const SelectAccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('accounttype');
    final cubit = AuthCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 16.0, right: 16),
        child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) {
            return current is AccountTypeSelected;
          },
          builder: (context, state) {
            print('accounttype builder');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80.sp),
                  child: Image.asset(kLogo, width: 80.w, height: 80.h),
                ),
                SizedBox(height: RespCalc().heightRatio(30)),
                Text(LangKeys.selectAccType, style: getStyle20(context)),
                SizedBox(height: RespCalc().heightRatio(30)),
                Text(
                  LangKeys.selectRoleDes,
                  style: getStyle16(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: RespCalc().heightRatio(96)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: cubit.selectedAccountType == AccountType.agency,
                      onChanged: (val) {
                        cubit.selectAccountType(AccountType.agency);
                      },
                      side: BorderSide(color: neutralClr2),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LangKeys.agency, style: getStyle20(context)),
                          Text(LangKeys.agencyDes, style: getStyle16(context)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: RespCalc().heightRatio(42)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value:
                          cubit.selectedAccountType == AccountType.freelancer,
                      onChanged: (val) {
                        cubit.selectAccountType(AccountType.freelancer);
                      },
                      side: BorderSide(color: neutralClr2),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LangKeys.freelance, style: getStyle20(context)),
                          Text(
                            LangKeys.freelanceDes,
                            style: getStyle16(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                cubit.selectedAccountType == AccountType.none
                    ? CheckPrimaryButton(text: LangKeys.continueButton)
                    : PrimaryButton(
                      callBack: () {
                        cubit.selectedAccountType == AccountType.agency
                            ? Navigator.pushNamed(
                              context,
                              screens.agencyScreen,
                              arguments: cubit,
                            )
                            : Navigator.pushNamed(
                              context,
                              screens.freelanceScreen,
                              arguments: cubit,
                            );
                      },
                      text: LangKeys.continueButton,
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}

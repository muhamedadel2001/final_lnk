import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/fonts.dart';
import '../../data/on_boarding_model.dart';
import '../../manager/cubit/on_boarding_cubit.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/on_boarding_button.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingCubit boardingCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    boardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    boardingCubit.initializeOnBoardingModels(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<OnBoardingCubit, int>(
          builder: (context, state) {
            return boardingCubit.index != 0
                ? IconButton(
                  onPressed: () {
                    boardingCubit.previousPage(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                )
                : SizedBox.shrink();
          },
        ),
        actions: [
          BlocBuilder<OnBoardingCubit, int>(
            builder: (context, state) {
              return boardingCubit.index != 2
                  ? TextButton(
                    onPressed: () {
                      MyCache.setBool(
                        key: MyCacheKeys.onBoardingViewed,
                        value: true,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        screens.loginScreen,
                        (route) => false,
                      );
                    },
                    child: Text(
                      LangKeys.skip,
                      style: getStyle16(context).copyWith(color: Colors.black),
                    ),
                  )
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardingCubit.controller,
              itemCount: boardingCubit.onBordingModelList.length,
              itemBuilder: (context, index) {
                OnBoardingModel boardingModel =
                    boardingCubit.onBordingModelList[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20.0,
                    top: 18,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 345.h,
                          width: 307.w,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: AssetImage(boardingModel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        DotIndicator(),
                        SizedBox(height: 60.h),
                        Text(
                          boardingModel.title,
                          style: getStyle25(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          boardingModel.subTitle,
                          style: getStyle16(context),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25.h),
                        OnBoardingButton(),
                      ],
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                boardingCubit.onChangePage(index);
              },
            ),
          ),

          // OnBoardingButton()
        ],
      ),
    );
  }
}

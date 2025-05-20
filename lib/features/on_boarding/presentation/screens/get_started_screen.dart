import 'package:easy_localization/easy_localization.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;
import 'package:flutter/material.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/fonts.dart';
import '../../../../core/widgets/primary_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/imgs/on_boarding/city.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(.0),
                  Colors.white.withOpacity(.0),
                  Colors.white.withOpacity(.1),
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/on_boarding/shadow2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: const AssetImage('assets/imgs/on_boarding/map.png'),
              fit: BoxFit.cover,
              height: RespCalc().heightRatio(413),
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: RespCalc().heightRatio(275),
            child: Padding(
              padding: EdgeInsets.only(
                left:
                    context.locale.languageCode == 'en'
                        ? RespCalc().widthRatio(20)
                        : 0,
                right:
                    context.locale.languageCode == 'en'
                        ? 0
                        : RespCalc().widthRatio(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LangKeys.getStarted,
                    style: getStyle39(context).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                callBack: () {
                  MyCache.getString(key: MyCacheKeys.token) != ''
                      ? Navigator.pushNamedAndRemoveUntil(
                        context,
                        screens.homeLandingScreen,
                        (route) => false,
                      )
                      : Navigator.pushNamed(context, screens.onBoardingScreen);
                },

                text: LangKeys.getStarted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

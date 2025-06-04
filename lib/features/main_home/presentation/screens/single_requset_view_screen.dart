import 'dart:io';

import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/contact_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_location_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_price_range.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_property_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_sliver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/global_error_widget.dart';

class SingleRequsetViewScreen extends StatefulWidget {
  final String id;

  const SingleRequsetViewScreen({super.key, required this.id});

  @override
  State<SingleRequsetViewScreen> createState() =>
      _SingleRequsetViewScreenState();
}

class _SingleRequsetViewScreenState extends State<SingleRequsetViewScreen> {
  @override
  void initState() {
    HomeLandingCubit.get(context).getOneRequest(
      lang: MyCache.getString(key: MyCacheKeys.language),
      context: context,
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('one request');
    final cubit = HomeLandingCubit.get(context);
    return BlocBuilder<HomeLandingCubit, HomeLandingState>(
      builder: (context, state) {
        print('one request build');
        return state is GetOneSuccess
            ? Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  RequestSliverAppBar(title: LangKeys.requestDetails),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LangKeys.description,
                            style: getStyle25(context),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            cubit.requestModel!.request.description,
                            style: getStyleBold13(
                              context,
                            ).copyWith(color: textSecondaryClr),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            LangKeys.propertyDetails,
                            style: getStyle25(context),
                          ),
                          const SizedBox(height: 12),
                          RequestPropertyDetails(),
                          const SizedBox(height: 12),
                          RequestPriceRange(),
                          const SizedBox(height: 12),
                          Text(LangKeys.location, style: getStyle25(context)),
                          const SizedBox(height: 12),
                          RequestLocationDetails(),
                          const SizedBox(height: 20),
                          const ContactDetails(),
                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            : state is GetOneLoading
            ? Scaffold(
              body: Center(
                child:
                    Platform.isIOS
                        ? CupertinoActivityIndicator(color: primaryClr)
                        : CircularProgressIndicator(color: primaryClr),
              ),
            )
            : Scaffold(
              appBar: AppBar(),
              body: Center(
                child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
              ),
            );
      },
    );
  }
}

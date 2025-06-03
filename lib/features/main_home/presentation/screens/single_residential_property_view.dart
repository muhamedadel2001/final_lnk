import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/about_property.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/contact_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/photos_list_view.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/pirce_property_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/property_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/databases/cache/my_cache.dart';
import '../../../../core/databases/cache/my_cache_keys.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/badge_on_image.dart';
import '../../../../core/widgets/global_error_widget.dart';
import '../../../home_landing/presentation/manager/home_landing_cubit.dart';

class SingleResidentialPropertyView extends StatefulWidget {
  final String id;
  const SingleResidentialPropertyView({super.key, required this.id});

  @override
  State<SingleResidentialPropertyView> createState() =>
      _SingleResidentialPropertyViewState();
}

class _SingleResidentialPropertyViewState
    extends State<SingleResidentialPropertyView> {
  @override
  void initState() {
    HomeLandingCubit.get(context).getOneList(
      lang: MyCache.getString(key: MyCacheKeys.language),
      context: context,
      id: widget.id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('one list');
    final cubit = HomeLandingCubit.get(context);
    return BlocBuilder<HomeLandingCubit, HomeLandingState>(
      builder: (context, state) {
        print('one list rebuild');
        return state is GetOneSuccess
            ? Scaffold(
              appBar: AppBar(
                leadingWidth: 30.w,
                title: Row(
                  children: [
                    cubit.listsModel!.list.userId.image == null ||
                            cubit.listsModel!.list.userId.image == ""
                        ? ClipRRect(
                          child: Image.asset(
                            'assets/imgs/user_circle.png',
                            width: 45.w,
                            height: 45.w,
                            fit: BoxFit.cover,
                          ),
                        )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: CachedNetworkImage(
                            width: 45.w,
                            height: 45.w,
                            fit: BoxFit.cover,
                            imageUrl:
                                "${ApiConstants.userUrlImages}${cubit.listsModel!.list.userId.image}",
                          ),
                        ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cubit.listsModel!.list.userId.name!,
                            style: getStyleBold16(context),
                          ),
                          Text(
                            cubit.listsModel!.title,
                            style: getStyle13(
                              context,
                            ).copyWith(color: textSecondaryClr),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35),
                      Text(
                        cubit.listsModel!.list.title,
                        style: getStyle20(context),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 204.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          children: [
                            cubit.listsModel!.list.images.isEmpty
                                ? Image.asset(
                                  'assets/imgs/zc.png',
                                  width: double.infinity,
                                  height: 204.h,
                                  fit: BoxFit.cover,
                                )
                                : CachedNetworkImage(
                                  height: 204.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "${ApiConstants.homeImages}${cubit.listsModel!.list.images[0]}",
                                ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BadgeOnImage(
                                  price: cubit.listsModel!.list.apartment.name,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BadgeOnImage(
                                  price: cubit.listsModel!.list.type,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(LangKeys.description, style: getStyle25(context)),
                      const SizedBox(height: 12),
                      Text(
                        cubit.listsModel!.list.description,
                        style: getStyleBold13(
                          context,
                        ).copyWith(color: textSecondaryClr),
                      ),
                      const SizedBox(height: 25),
                      cubit.listsModel!.list.images.isNotEmpty
                          ? Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    LangKeys.photos,
                                    style: getStyle25(context),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        photoListScreen,
                                        arguments: cubit,
                                      );
                                    },
                                    child: Text(LangKeys.viewAll),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              PhotosListView(),
                            ],
                          )
                          : SizedBox.shrink(),
                      const SizedBox(height: 30),
                      Text(
                        LangKeys.propertyDetails,
                        style: getStyle25(context),
                      ),
                      PropertyInfo(),
                      const SizedBox(height: 15),
                      Text(LangKeys.aboutProperty, style: getStyle25(context)),
                      const SizedBox(height: 12),
                      AboutProperty(),
                      const SizedBox(height: 18),
                      const PircePropertyDetails(),
                      const SizedBox(height: 23),
                      Text(LangKeys.location, style: getStyle25(context)),
                      const SizedBox(height: 20),
                      Text(
                        '${cubit.listsModel!.list.city.name} - ${cubit.listsModel!.list.location.name}',
                        style: getStyle13(context),
                      ),
                      const SizedBox(height: 20),
                      const ContactDetails(),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              ),
            )
            : state is GetOneLoading
            ? Scaffold(
              body: Center(
                child:
                    Platform.isIOS
                        ? CupertinoActivityIndicator.partiallyRevealed(
                          color: primaryClr,
                        )
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

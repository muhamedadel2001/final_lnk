import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/colors.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/features/settings/presentation/manager/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/widgets/global_error_widget.dart';
import '../../../../home_landing/presentation/manager/home_landing_cubit.dart';
import '../../../data/model/my_list_model.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({super.key});

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  @override
  void initState() {
    SettingsCubit.get(
      context,
    ).getMyList(lang: MyCache.getString(key: MyCacheKeys.language));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state is GetMyRequestLoading || state is GetMyListLoading?
            ? Center(
              child:
                  Platform.isIOS
                      ? CupertinoActivityIndicator(color: primaryClr)
                      : CircularProgressIndicator(color: primaryClr),
            )
            : state is GetMyRequestSuccess || state is GetMyListSuccess
            ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    "${cubit.myListModel!.count} ${LangKeys.items}",
                    style: getStyle13(context),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      itemCount: cubit.myListModel!.listings!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder:
                          (context, index) => PropertyCard(
                            listings: cubit.myListModel!.listings![index],
                            onTap: () async {
                              String? isRefresh = await Navigator.pushNamed(
                                context,
                                singlePropertyScreen,
                                arguments: {
                                  'id': cubit.myListModel!.listings![index].sId,
                                  'cubit': HomeLandingCubit.get(context),
                                  "fromProfile": true,
                                },
                              );
                              if (isRefresh == 'refresh') {
                                cubit.getMyList(
                                  lang: MyCache.getString(
                                    key: MyCacheKeys.language,
                                  ),
                                );
                              }
                            },
                          ),
                    ),
                  ),
                ],
              ),
            )
            : Center(
              child: GlobalErrorWidget(imagePath: 'assets/imgs/user.png'),
            );
      },
    );
  }
}

class PropertyCard extends StatelessWidget {
  final void Function()? onTap;
  final Listings listings;
  const PropertyCard({super.key, required this.listings, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 2.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child:
                listings.images == null
                    ? Image.asset(
                      'assets/imgs/free.jpg',
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                    : CachedNetworkImage(
                      imageUrl: '${ApiConstants.homeImages}${listings.images}',
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.error, color: Colors.redAccent),
                    ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    listings.title!,
                    style: getStyleBold13(context),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryClr,
                        size: 12.sp,
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 2,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          listings.location!.name!,
                          style: getStyle10(context),
                        ),
                      ),
                      SvgPicture.asset('assets/imgs/distance.svg', width: 12.w),
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 1,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          listings.area!,
                          style: getStyle10(context),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/imgs/price.svg', width: 12.w),
                      SizedBox(width: 2.w),
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          listings.price!,
                          style: getStyle10(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Flexible(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/imgs/office.svg', width: 12.w),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            listings.apartment!.name!,
                            style: getStyle10(context),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: primaryClr,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              LangKeys.view,
                              style: getStyle10(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:final_lnk/core/databases/cache/my_cache.dart';
import 'package:final_lnk/core/databases/cache/my_cache_keys.dart';
import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/contact_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_location_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_price_range.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_property_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          RequestSliverAppBar(title: 'Request Details'),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LangKeys.description, style: getStyle25(context)),
                  const SizedBox(height: 12),
                  Text(
                    'This well-located apartment is available for sale and offers easy access to nearby amenities. The sale is expected to close soon. The apartment is in good condition and includes modern facilities.',
                    style: getStyleBold13(
                      context,
                    ).copyWith(color: textSecondaryClr),
                  ),
                  const SizedBox(height: 12),
                  Text(LangKeys.propertyDetails, style: getStyle25(context)),
                  const SizedBox(height: 12),
                  const RequestPropertyDetails(),
                  const SizedBox(height: 12),
                  const RequestPriceRange(),
                  const SizedBox(height: 12),
                  Text(LangKeys.location, style: getStyle25(context)),
                  const SizedBox(height: 12),
                  const RequestLocationDetails(),
                  const SizedBox(height: 20),
                  const ContactDetails(),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

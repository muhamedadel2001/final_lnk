import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/contact_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_location_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_price_range.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_property_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/request_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';

class SingleRequsetViewScreen extends StatelessWidget {
  const SingleRequsetViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeLandingCubit.get(context);
    print(cubit.index);
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/screens.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/about_property.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/contact_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/photos_list_view.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/pirce_property_details.dart';
import 'package:final_lnk/features/main_home/presentation/screens/widgets/property_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/resp_calc.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/lang_keys.dart';
import '../../../../core/widgets/badge_on_image.dart';
import '../../../../core/widgets/favourite.dart';

class SingleResidentialPropertyView extends StatelessWidget {
  const SingleResidentialPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              minRadius: 30,
              backgroundImage: AssetImage('assets/imgs/profile_image.png'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    'Mohamed Adel Ali',
                    style: getStyle20(context),
                  ),
                  Text(
                    'Agent at Raya ',
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
              Text('Classic Apartment For sale', style: getStyle20(context)),
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
                    Image.asset(
                      'assets/imgs/zc.png',
                      width: double.infinity,
                      height: 204.h,
                      fit: BoxFit.cover,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Favourite(isLiked: false),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BadgeOnImage(price: 'Apartment'),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BadgeOnImage(price: 'Sale'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text(LangKeys.description, style: getStyle25(context)),
              const SizedBox(height: 12),
              Text(
                'This well-located apartment is available for sale and offers easy access to nearby amenities. The sale is expected to close soon. The apartment is in good condition and includes modern facilities.',
                style: getStyleBold13(
                  context,
                ).copyWith(color: textSecondaryClr),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(LangKeys.photos, style: getStyle25(context)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(photoListScreen);
                    },
                    child: Text(LangKeys.viewAll),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const PhotosListView(),
              const SizedBox(height: 30),
              Text(LangKeys.propertyDetails, style: getStyle25(context)),
              const PropertyInfo(),
              const SizedBox(height: 15),
              Text(LangKeys.aboutProperty, style: getStyle25(context)),
              const SizedBox(height: 12),
              const AboutProperty(),
              const SizedBox(height: 18),
              const PircePropertyDetails(),
              const SizedBox(height: 23),
              Text(LangKeys.location, style: getStyle25(context)),
              const SizedBox(height: 20),
              Text(
                'Fifth Settlement - 9th Street , smoha',
                style: getStyle13(context),
              ),
              const SizedBox(height: 20),
              const ContactDetails(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

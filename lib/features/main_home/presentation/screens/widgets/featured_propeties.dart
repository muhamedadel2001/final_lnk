import 'package:flutter/material.dart';

import '../../../../../core/logic/resp_calc.dart';
import 'featured_property_item.dart';

class FeaturedPropeties extends StatelessWidget {
  const FeaturedPropeties({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 225, maxHeight: 275),
      child: SizedBox(
        height: RespCalc().heightRatio(275),
        child: ListView.builder(
          // clipBehavior: Clip.none,
          itemBuilder: (context, index) => const FeaturedPropertyItem(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

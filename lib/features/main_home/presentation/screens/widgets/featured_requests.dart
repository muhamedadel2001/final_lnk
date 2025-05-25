import 'package:flutter/material.dart';

import '../../../../../core/logic/resp_calc.dart';
import 'featured_request_item.dart';

class FeaturedRequests extends StatelessWidget {
  const FeaturedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 150, maxHeight: 220),
      child: SizedBox(
        height: RespCalc().heightRatio(220),
        child: ListView.builder(
          itemBuilder: (context, index) => const FeaturedRequestItem(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

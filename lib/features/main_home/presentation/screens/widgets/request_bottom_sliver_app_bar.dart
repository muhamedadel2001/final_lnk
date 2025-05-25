import 'package:final_lnk/core/util/fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/util/colors.dart';

class RequestBottomSliverAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RequestBottomSliverAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
      child: Row(
        children: [
          const CircleAvatar(
            minRadius: 25,
            backgroundImage: AssetImage('assets/imgs/profile_image.png'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Adam mohamed', style: getStyleBold16(context)),
              Text(
                'Agent at raya aganecy',
                style: getStyleBold13(
                  context,
                ).copyWith(color: textSecondaryClr, fontSize: 11.5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40); // AppBar height
}

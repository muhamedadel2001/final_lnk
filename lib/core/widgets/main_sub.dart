import 'dart:ui';
import 'package:final_lnk/core/widgets/subscription_screen.dart';
import 'package:flutter/material.dart';

class SubscriptionBlockerOverlay extends StatelessWidget {
  const SubscriptionBlockerOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          // Blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          const SubscriptionDialog(),
        ],
      ),
    );
  }
}

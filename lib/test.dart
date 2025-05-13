import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mohamed adel',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text(
            'Mohamed adel',
            style: GoogleFonts.quicksand(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'محمد عادل',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text(
            'محمد عادل',
            style: GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

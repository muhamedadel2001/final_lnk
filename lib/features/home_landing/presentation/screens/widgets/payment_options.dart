import 'package:final_lnk/features/home_landing/presentation/manager/home_landing_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'installment_options.dart';
import 'option_box.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  @override
  Widget build(BuildContext context) {
    final addPropertyCubit = BlocProvider.of<HomeLandingCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addPropertyCubit.payment = 'cash';
                  setState(() {});
                },
                child: OptionBox(title: 'cash'),
              ),
            ),
            const SizedBox(width: 26),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addPropertyCubit.payment = 'installment';
                  setState(() {});
                },
                child: OptionBox(title: 'installment'),
              ),
            ),
          ],
        ),
        addPropertyCubit.payment == 'installment'
            ? const InstallmentOptions()
            : const SizedBox(width: 0, height: 0),
      ],
    );
  }
}

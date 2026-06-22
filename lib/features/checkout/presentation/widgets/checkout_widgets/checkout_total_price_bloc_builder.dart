import 'package:flutter/material.dart';
import '../../cubit/checkout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'total_price_section.dart';

class CheckoutTotalPriceBlocBuilder extends StatelessWidget {
  final int basePrice;

  const CheckoutTotalPriceBlocBuilder({super.key, required this.basePrice});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final currentTotal = state.maybeWhen(
          quantityUpdated: (_, totalPrice) => totalPrice,
          orElse: () => basePrice,
        );
        return TotalPriceSection(totalPrice: '\$ $currentTotal');
      },
    );
  }
}

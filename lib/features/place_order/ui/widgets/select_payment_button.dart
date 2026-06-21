// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../stripe_payment/payment_manger.dart';
import '../../../../core/shared/app_selected_product.dart';

class SelectPaymentButton extends StatelessWidget {
  const SelectPaymentButton({super.key, required this.onCardInfoSaved});
  final Function(Map<String, dynamic>) onCardInfoSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await PaymentManger.makePayment(20, 'USD');
        } catch (error) {
          print(error);
        }
      },
      child: const Customselectedorder(
        name: "Add payment details",
        iconImage: 'assets/images/icons/Forward_down.svg',
        isFree: false,
      ),
    );
  }
}

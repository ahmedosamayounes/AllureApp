// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_application/core/shared/app_selected_product.dart';
import 'package:flutter_application/core/stripe_payment/payment_manger.dart';

class SelectPaymentButton extends StatelessWidget {
  const SelectPaymentButton({
    super.key,
    required this.onCardInfoSaved,
    required this.amount,
  });

  final Function(Map<String, dynamic>) onCardInfoSaved;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await PaymentManger.makePayment(amount, 'USD');

          onCardInfoSaved({
            "status": "success",
            "amountPaid": amount,
            "paymentMethod": "Stripe Card",
          });
        } catch (error) {
          print("Stripe Payment Error: $error");
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

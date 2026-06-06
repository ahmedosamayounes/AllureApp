import 'package:flutter/material.dart';
import '../../../../core/shared/app_selected_product.dart';
import 'visa.dart';

class SelectPaymentButton extends StatelessWidget {
  const SelectPaymentButton({super.key, required this.onCardInfoSaved});
  final Function(Map<String, dynamic>) onCardInfoSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final data = await Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => const Visa()),
        );
        if (data != null && data is Map<String, dynamic>) {
          onCardInfoSaved(data);
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

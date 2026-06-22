import 'package:flutter/material.dart';
import '../../../../../core/shared/app_selected_product.dart';
import 'userinfo.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key, required this.onAddressSaved});

  final Function(Map<String, dynamic>) onAddressSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final data = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Userinfo()),
        );

        if (data != null && data is Map<String, dynamic>) {
          onAddressSaved(data);
        }
      },
      child: const Customselectedorder(
        name: "Add delivery address",
        iconImage: 'assets/images/icons/Plus.svg',
        isFree: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/app_product_card.dart';
import '../../../../home/data/models/product_model.dart';
import '../../cubit/checkout_cubit.dart';


class CheckoutProductCardBlocBuilder extends StatelessWidget {
  final ProductModel product;

  const CheckoutProductCardBlocBuilder({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return AppProductCard(
          image: product.imageUrl ?? '',
          name: product.product_name ?? '',
          price: product.product_price ?? 0,
          onChanged: (quantity) {
            context.read<CheckoutCubit>().updateQuantity(quantity);
          },
        );
      },
    );
  }
}

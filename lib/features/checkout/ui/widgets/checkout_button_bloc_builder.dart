import 'package:flutter/material.dart';
import '../../../../core/shared/app_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/checkout_cubit.dart';

class CheckoutButtonBlocBuilder extends StatelessWidget {
  const CheckoutButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          placeOrderLoading: () => true,
          orElse: () => false,
        );

        return GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  context.read<CheckoutCubit>().placeOrder();
                },
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                )
              : const AppButton(name: 'Checkout'),
        );
      },
    );
  }
}

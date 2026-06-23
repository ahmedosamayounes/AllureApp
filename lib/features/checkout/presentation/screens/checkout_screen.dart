import 'package:flutter/material.dart';
import 'package:flutter_application/features/checkout/presentation/widgets/checkout_widgets/checkout_total_price_bloc_builder.dart';
import '../widgets/checkout_widgets/checkout_button_bloc_builder.dart';
import '../widgets/checkout_widgets/checkout_product_card_bloc_builder.dart';
import '../widgets/checkout_widgets/delivery_section.dart';
import '../widgets/checkout_widgets/promo_code_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/checkout_cubit.dart';
import '../../../home/data/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/shared/app_bar.dart';
import '../../../../core/shared/app_header_text.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.product});

  final ProductModel product; 

  @override
  Widget build(BuildContext context) {
    context.read<CheckoutCubit>().initProductPrice(product);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Customappbar(isblack: false),
      body: SafeArea(
        child: BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            state.maybeWhen(
              placeOrderSuccess: (orderId) {
                Navigator.pushNamed(
                  context,
                  Routes.placeOrderScreen,
                  arguments: {
                    'product': product,
                    'checkoutCubit': context.read<CheckoutCubit>(),
                  },
                );
              },
              placeOrderError: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0.r),
                  child: Column(
                    children: [
                      Center(
                        child: AppHeaderText(
                          title: "Order Summary",
                          size: 26.sp,
                          isSvg: true,
                        ),
                      ),
                      Gap(15.h),
                      CheckoutProductCardBlocBuilder(product: product),
                      Gap(20.h),
                      const PromoCodeSection(),
                      Gap(15.h),
                      const Divider(),
                      Gap(15.h),
                      const DeliverySection(),
                      Gap(60.h),
                      CheckoutTotalPriceBlocBuilder(
                        basePrice: product.product_price ?? 0,
                      ),
                    ],
                  ),
                ),
                Gap(42.h),
                const CheckoutButtonBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

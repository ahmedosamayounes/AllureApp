import 'package:flutter/material.dart';
import '../widgets/place_order_widgets/add_address_button.dart';
import '../widgets/place_order_widgets/payment_details_cart.dart';
import '../widgets/place_order_widgets/select_payment_button.dart';
import '../../../../core/shared/app_bar.dart';
import '../../../../core/shared/app_button.dart';
import '../../../../core/shared/app_header_text.dart';
import '../../../../core/shared/app_success_dialog.dart';
import '../../../../core/shared/app_text_info.dart';
import '../../../../core/theming/colors.dart';
import '../cubit/checkout_cubit.dart';
import '../widgets/place_order_widgets/address_details_card.dart';
import '../widgets/place_order_widgets/order_review_card.dart';
import '../../../home/data/models/product_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  final ProductModel product;

  const PlaceOrderScreen({super.key, required this.product});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrderScreen> {
  Map<String, dynamic>? _savedAddress;
  Map<String, dynamic>? _savedCardInfo;

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    final int currentQuantity = checkoutCubit.quantity;
    final int currentTotal = checkoutCubit.totalPrice;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final state = context.read<CheckoutCubit>().state;

        final isLoading = state.maybeWhen(
          placeOrderLoading: () => true,
          orElse: () => false,
        );

        if (isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please wait until the payment process is finished!',
              ),
              backgroundColor: Colorss.primreColor,
            ),
          );
          return;
        }

        context.read<CheckoutCubit>().resetCheckout();
        Navigator.pop(context);
      },

      child: BlocListener<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          state.maybeWhen(
            placeOrderSuccess: (generatedOrderId) {
              _showSuccessDialog(context, generatedOrderId);
            },
            placeOrderError: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const Customappbar(isblack: false),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AppHeaderText(
                            title: "Order Review",
                            size: 26.sp,
                            isSvg: true,
                          ),
                        ),
                        Gap(24.h),
                        const AppTextInfo(name: "Delivery Address"),
                        Gap(8.h),
                        _savedAddress == null
                            ? AddAddressButton(
                                onAddressSaved: (data) {
                                  setState(() {
                                    _savedAddress = data;
                                  });
                                },
                              )
                            : AddressDetailsCard(
                                savedAddress: _savedAddress ?? {},
                              ),

                        Gap(20.h),
                        const Divider(),
                        Gap(20.h),
                        const AppTextInfo(name: 'How You\'ll Pay'),
                        Gap(8.h),
                        _savedCardInfo == null
                            ? SelectPaymentButton(
                                amount: currentTotal,
                                onCardInfoSaved: (data) {
                                  setState(() {
                                    _savedCardInfo = data;
                                  });
                                },
                              )
                            : PaymentDetailsCart(
                                savedCardInfo: _savedCardInfo!,
                              ),

                        Gap(20.h),
                        const Divider(),
                        Gap(20.h),
                        const AppTextInfo(name: 'Order Review'),
                        Gap(10.h),
                        OrderReviewCard(
                          image: widget.product.imageUrl ?? '',
                          name: widget.product.product_name ?? '',
                          price: widget.product.product_price ?? 0,
                          quantity: currentQuantity,
                        ),

                        Gap(15.h),
                        const Divider(),
                        Gap(15.h),
                        _buildTotalSection(totalPrice: currentTotal),
                      ],
                    ),
                  ),
                  Gap(28.h),
                  BlocBuilder<CheckoutCubit, CheckoutState>(
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        placeOrderLoading: () => true,
                        orElse: () => false,
                      );

                      if (isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          if (_savedAddress == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please Add a Delivery Address',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontFamily: "TenorSans",
                                  ),
                                ),
                              ),
                            );
                            return;
                          }

                          if (_savedCardInfo == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select a payment method',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontFamily: "TenorSans",
                                  ),
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<CheckoutCubit>().placeFinalOrder(
                            paymentDetails: _savedCardInfo!,
                            address: _savedAddress!,
                          );
                        },
                        child: const AppButton(name: 'Place order'),
                      );
                    },
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalSection({required int totalPrice}) {
    return Row(
      children: [
        Text(
          'Total'.toUpperCase(),
          style: TextStyle(
            fontSize: 16.sp,
            letterSpacing: 5,
            fontFamily: "TenorSans",
          ),
        ),
        const Spacer(),
        Text(
          '\$ $totalPrice',
          style: TextStyle(
            color: Colorss.priceColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "TenorSans",
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context, String orderId) {
    final checkoutCubit = context.read<CheckoutCubit>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => BlocProvider.value(
        value: checkoutCubit,
        child: AppSuccessDialog(orderId: orderId),
      ),
    );
  }
}

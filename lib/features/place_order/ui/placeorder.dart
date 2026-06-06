import 'package:flutter/material.dart';
import '../../../core/shared/app_bar.dart';
import '../../../core/shared/app_button.dart';
import '../../../core/shared/app_success_dialog.dart';
import '../../../core/shared/app_header_text.dart';
import '../../../core/shared/app_text_info.dart';
import '../../../core/theming/colors.dart';
import 'widgets/add_address_button.dart';
import 'widgets/address_details_card.dart';
import 'widgets/order_review_card.dart';
import 'widgets/payment_details_cart.dart';
import 'widgets/select_payment_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../checkout/logic/cubit/checkout_cubit.dart';
import '../../home/data/models/product_model.dart';

class PlaceOrder extends StatefulWidget {
  final ProductModel product;

  const PlaceOrder({super.key, required this.product});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  Map<String, dynamic>? _savedAddress;
  Map<String, dynamic>? _savedCardInfo;

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    final int currentQuantity = checkoutCubit.quantity;
    final int currentTotal = checkoutCubit.totalPrice;
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.maybeWhen(
          placeOrderSuccess: () {
            _showSuccessDialog(context);
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
                              onCardInfoSaved: (data) {
                                setState(() {
                                  _savedCardInfo = data;
                                });
                              },
                            )
                          : PaymentDetailsCart(),

                      Gap(20.h),
                      const Divider(),
                      Gap(15.h),
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
                GestureDetector(
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
                      address: _savedAddress!,
                    );
                  },
                  child: const AppButton(name: 'Place order'),
                ),
              ],
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AppSuccessDialog(),
    );
  }
}

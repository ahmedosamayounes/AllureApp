import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/data/models/product_model.dart';
import '../../domain/use_case/place_order_use_case.dart';

part 'checkout_cubit.freezed.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final PlaceOrderUseCase _placeOrderUseCase;

  CheckoutCubit(this._placeOrderUseCase) : super(const CheckoutState.initial());

  int quantity = 1;
  int basePrice = 0;
  int totalPrice = 0;
  ProductModel? currentProduct;

  void initProductPrice(ProductModel product) {
    currentProduct = product;
    basePrice = product.product_price ?? 0;
    totalPrice = basePrice;
  }

  void updateQuantity(int newQuantity) {
    quantity = newQuantity;
    totalPrice = basePrice * quantity;

    emit(
      CheckoutState.quantityUpdated(quantity: quantity, totalPrice: totalPrice),
    );
  }

  // 🔥 1. دالة الـ Reset اللي كانت ناقصانا عشان ننظف الداتا بعد النجاح
  void resetCheckout() {
    quantity = 1;
    basePrice = 0;
    totalPrice = 0;
    currentProduct = null;
    emit(const CheckoutState.initial());
  }

  // الدالة دي لو لسة بتستخدمها للتست، خليها ترجع أي ID عشوائي
  Future<void> placeOrder() async {
    emit(const CheckoutState.placeOrderLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const CheckoutState.placeOrderSuccess(orderId: 'TEST-12345')); // 👈 ضفنا ID تجريبي
    } catch (e) {
      emit(CheckoutState.placeOrderError(message: e.toString()));
    }
  }

  Future<void> placeFinalOrder({
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  }) async {
    if (isClosed) return;
    emit(const CheckoutState.placeOrderLoading());

    try {
      final String generatedOrderId = await _placeOrderUseCase(
        productName: currentProduct?.product_name,
        quantity: quantity,
        totalPrice: totalPrice,
        address: address,
        paymentDetails: paymentDetails,
      );

      if (!isClosed) {
        emit(CheckoutState.placeOrderSuccess(orderId: generatedOrderId)); // 👈 باصي الـ ID للـ State
      }
    } catch (e) {
      emit(CheckoutState.placeOrderError(message: e.toString()));
    }
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.dart';
part 'checkout_cubit.freezed.dart';
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState.initial());

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

  Future<void> placeOrder() async {
    emit(const CheckoutState.placeOrderLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const CheckoutState.placeOrderSuccess());
    } catch (e) {
      emit(CheckoutState.placeOrderError(message: e.toString()));
    }
  }

  Future<void> placeFinalOrder({required Map<String, dynamic> address}) async {
    if (isClosed) return;
    emit(const CheckoutState.placeOrderLoading());

    try {
      await FirebaseFirestore.instance.collection('orders').add({
        'productName': currentProduct?.product_name,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'address': address,
      });

      if (!isClosed) emit(const CheckoutState.placeOrderSuccess());
    } catch (e) {
      emit(CheckoutState.placeOrderError(message: e.toString()));
    }
  }
}

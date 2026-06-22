part of 'checkout_cubit.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;

  const factory CheckoutState.quantityUpdated({
    required int quantity,
    required int totalPrice,
  }) = _QuantityUpdated;

  const factory CheckoutState.placeOrderLoading() = _PlaceOrderLoading;
const factory CheckoutState.placeOrderSuccess({required String orderId}) = _PlaceOrderSuccess;
const factory CheckoutState.placeOrderError({required String message}) =
      _PlaceOrderError;
}

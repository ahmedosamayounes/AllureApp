import '../repository/checkout_repository.dart';

class   PlaceOrderUseCase {
  final CheckoutRepository _repository;

  PlaceOrderUseCase(this._repository);

  Future<String> call({
    required String? productName,
    required int quantity,
    required int totalPrice,
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  }) async {
   return await _repository.placeOrder(
      productName: productName,
      quantity: quantity,
      totalPrice: totalPrice,
      address: address,
      paymentDetails: paymentDetails,
    );
  }
}
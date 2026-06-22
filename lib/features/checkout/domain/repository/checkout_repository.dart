abstract class CheckoutRepository {
  Future<String> placeOrder({
    required String? productName,
    required int quantity,
    required int totalPrice,
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  });
}


import '../../domain/repository/checkout_repository.dart';
import '../data_source/checkout_remote_data_source.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepositoryImpl(this._remoteDataSource);

  @override
  Future<String> placeOrder({
    required String? productName,
    required int quantity,
    required int totalPrice,
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  }) async {
 return   await _remoteDataSource.placeOrder(
      productName: productName,
      quantity: quantity,
      totalPrice: totalPrice,
      address: address,
      paymentDetails: paymentDetails,
    );
  }
}
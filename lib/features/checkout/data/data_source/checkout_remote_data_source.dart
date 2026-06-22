import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CheckoutRemoteDataSource {
  Future<String> placeOrder({
    required String? productName,
    required int quantity,
    required int totalPrice,
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final FirebaseFirestore _firestore;

  CheckoutRemoteDataSourceImpl(this._firestore);

  @override
  Future<String> placeOrder({
    required String? productName,
    required int quantity,
    required int totalPrice,
    required Map<String, dynamic> address,
    required Map<String, dynamic> paymentDetails,
  }) async {
final docRef = await _firestore.collection('orders').add({
      'productName': productName,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'address': address,
      'paymentDetails': paymentDetails,
    });
    return docRef.id;
  }
}
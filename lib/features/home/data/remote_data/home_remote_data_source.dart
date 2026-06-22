import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class HomeRemoteDataSource {
  Stream<QuerySnapshot> getProductsStream();
  // Take Like Photo From Collection FireStore in Firebase
  Future<String> getImageUrl(String path);
  // Take Path to convert to image to http
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  HomeRemoteDataSourceImpl(this._db, this._storage);

  @override
  Stream<QuerySnapshot> getProductsStream() {
    // inside Firestore give us collection name products and make it stream (Real-time)
    return _db.collection('products').snapshots();
  }

  @override
  // take path and convert to Url (http)  by getDownloadURL
  Future<String> getImageUrl(String path) {
    return _storage.ref(path).getDownloadURL();
  }
}

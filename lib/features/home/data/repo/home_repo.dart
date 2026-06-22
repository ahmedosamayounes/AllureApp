import '../../domain/repository/home_repository.dart';

import '../models/product_model.dart';
import '../remote_data/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Stream<List<ProductModel>> getProducts() {
    return _remoteDataSource.getProductsStream().asyncMap((snapshot) async {
      List<ProductModel> productsList = [];

      for (var doc in snapshot.docs) {
        //Casting
        final data = doc.data() as Map<String, dynamic>?;
        if (data == null) continue; 
        //Object
        var product = ProductModel.fromJson(data);

        if (product.image != null && product.image!.isNotEmpty) {
          try {
            // convert the path (Firestore) to url (FireStorge)
            String url = await _remoteDataSource.getImageUrl(product.image!);
            product.imageUrl = url;
          } catch (e) {
            product.imageUrl = '';
          }
        }
        
        productsList.add(product);
      }
      
      return productsList;
    });
  }
}
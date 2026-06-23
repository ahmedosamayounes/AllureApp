import 'package:flutter_application/features/home/data/local_data/home_local_data_source.dart';

import '../../domain/repository/home_repository.dart';
import '../models/product_model.dart';
import '../remote_data/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Stream<List<ProductModel>> getProducts() async* {
    final localProducts = await _localDataSource.getCachedProducts();
    if (localProducts.isNotEmpty) {
      yield localProducts;
    }

    yield* _remoteDataSource.getProductsStream().asyncMap((snapshot) async {
      List<ProductModel> productsList = [];

      for (var doc in snapshot.docs) {
        // Casting
        final data = doc.data() as Map<String, dynamic>?;
        if (data == null) continue;

        // Object
        var product = ProductModel.fromJson(data);

        if (product.image != null && product.image!.isNotEmpty) {
          try {
            String url = await _remoteDataSource.getImageUrl(product.image!);
            product.imageUrl = url;
          } catch (e) {
            product.imageUrl = '';
          }
        }

        productsList.add(product);
      }

      await _localDataSource.cacheProducts(productsList);

      return productsList;
    });
  }
}

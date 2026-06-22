import '../../data/models/product_model.dart';

abstract class HomeRepository {
  Stream<List<ProductModel>> getProducts();
}
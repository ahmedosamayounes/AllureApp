import 'package:hive/hive.dart';
import '../models/product_model.dart';

abstract class HomeLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final String _boxName = 'products_box';

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    return box.values.toList();
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final box = await Hive.openBox<ProductModel>(_boxName);
    await box.clear();
    await box.addAll(products); 
  }
}
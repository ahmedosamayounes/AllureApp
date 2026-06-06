import '../models/product_model.dart';
import '../networking/home_service.dart';

class HomeRepo {
  final HomeService _homeService;
  HomeRepo(this._homeService);

  Stream<List<ProductModel>> getProducts() {
    return _homeService.getProducts().asyncMap((snapshot) async {
      List<ProductModel> products = [];

      for (var doc in snapshot.docs) {
        var product = ProductModel.fromJson(doc.data() as Map<String, dynamic>);

        if (product.image != null && product.image!.isNotEmpty) {
          try {
            String url = await _homeService.getImageUrl(product.image!);
            product.imageUrl = url; //put the URL in the model
          } catch (e) {
            product.imageUrl = '';
          }
        }
        products.add(product);
      }

      return products;
    });
  }
}

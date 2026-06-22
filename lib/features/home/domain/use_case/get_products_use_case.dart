import '../../data/models/product_model.dart';
import '../repository/home_repository.dart';

class GetProductsUseCase {
  final HomeRepository _homeRepository;

  GetProductsUseCase(this._homeRepository);

  Stream<List<ProductModel>> call() {
    return _homeRepository.getProducts();
  }
}
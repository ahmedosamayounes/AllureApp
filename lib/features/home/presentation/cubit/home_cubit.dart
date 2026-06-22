import 'dart:async'; // Required to use StreamSubscription

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';
import '../../domain/use_case/get_products_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<ProductModel> filteredProducts = [];
    List<ProductModel> products = [];
  final GetProductsUseCase _getProductsUseCase;
  // This variable holds the active live connection (Stream listener).
  // We use it later to stop listening and save device memory (RAM).
  StreamSubscription<List<ProductModel>>? _productsSubscription;
   
  // Constructor: sets the initial UI state when the Cubit is first created
  HomeCubit(this._getProductsUseCase) : super(const HomeState.initial());

  // Main function to fetch products in real-time
  void getProducts() {
    // 1. Tell the UI to show a loading spinner
    emit(const HomeState.loading());

    // 2. Safety Check: If there is an old listener running, close it first.
    // This prevents opening multiple connections at the same time.
    _productsSubscription?.cancel();

    // 3. Start listening to the UseCase Stream (Live connection with Firebase)
    _productsSubscription = _getProductsUseCase().listen(
      (productsList) {
        products = productsList;
        filteredProducts = productsList;
        // This blocks triggers automatically EVERY TIME data changes in Firebase.
        // It receives the clean list of products and sends it to the UI.
        emit(HomeState.success(productsList));
      },
      onError: (error) {
        // If the internet disconnects or firebase fails, catch the error and tell the UI
        emit(HomeState.error(message: error.toString()));
      },
    );
  }

  void searchProducts(String query) {
  if (query.isEmpty) {
    // if user delete the word 
    filteredProducts = products;
  } else {
    
    filteredProducts = products.where((product) {
      final name = product.product_name?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
  }
  
  emit(HomeState.success(filteredProducts));
}

  // Lifecycle function: Called automatically when the user exits the screen (Cubit dies)
  @override
  Future<void> close() {
    // VERY IMPORTANT: Stop listening to Firebase immediately when the screen is closed.
    // This prevents memory leaks and saves user internet package.
    _productsSubscription?.cancel();

    // Destroy the Cubit completely from memory
    return super.close();
  }
}

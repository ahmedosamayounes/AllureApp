import '../../data/models/product_model.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(const HomeState.loading());

    _homeRepo.getProducts().listen(
      (products) {
        emit(HomeState.success(products));
      },
      onError: (error) {
        emit(HomeState.error(message: error.toString()));
      },
    );
  }
}

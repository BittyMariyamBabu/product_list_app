import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/home/domain/usecases/get_product_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_event.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });
  }
}

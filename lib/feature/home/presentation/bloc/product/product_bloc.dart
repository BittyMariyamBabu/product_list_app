import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing_app/feature/home/domain/usecases/get_product_usecases.dart';
import 'package:product_listing_app/feature/home/domain/usecases/search_product_usecases.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_event.dart';
import 'package:product_listing_app/feature/home/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProducts;
  final SearchProductsUseCase searchProducts;

   List<ProductEntity> _allProducts = []; // store full product list locally

  ProductBloc({required this.getProducts,required this.searchProducts}) : super(ProductInitial()) {
    // Load all products
    on<LoadProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        _allProducts = await getProducts(); // populate the full list
        emit(ProductLoaded(_allProducts));

      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });

    // Search/filter products
    on<SearchProducts>((event, emit) async {
      final query = event.query.toLowerCase();
      if (query.isEmpty) {
        emit(ProductLoaded(_allProducts)); // Show full list if search cleared
        return;
      }
      if (query.length <= 4) return; // Do nothing if less than 4 chars  
      // Local filtering for faster UX
      final filtered = _allProducts
          .where((product) => product.productName.toLowerCase().contains(query))
          .toList();
      emit(ProductLoaded(filtered));

      // Call API for server-side search
        try {
          final products = await searchProducts.call(query: event.query);
          emit(ProductLoaded(products));
        } catch (_) {
          emit(ProductError("Failed"));
        }
    });
  }
}

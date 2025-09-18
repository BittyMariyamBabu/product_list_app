import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing_app/feature/home/domain/repositories/home_repository.dart';

/// A use case class responsible for fetching the list of products.
/// This class abstracts the product fetching logic from the presentation layer,
/// delegating the actual data retrieval to the [HomeRepository].
class SearchProductsUseCase {
  final HomeRepository repository;
  SearchProductsUseCase(this.repository);

  /// Fetches a list of [ProductEntity] objects. Delegates the call to the repository.
  Future<List<ProductEntity>> call({required String query}) async {
    return await repository.searchProduct(query: query);
  }
}

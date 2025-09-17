import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

// Product repository
abstract class ProductRepository {
  
  Future<List<ProductEntity>> getProduct();
}
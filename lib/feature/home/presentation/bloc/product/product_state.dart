import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> product;

  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}


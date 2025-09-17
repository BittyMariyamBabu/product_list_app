/// Represents a product in the domain layer of the application.
/// This entity is used in the Home screen, product lists.
class ProductEntity {
  final String id;
  final double salePrice;
  final double actualPrice;
  final String imageUrl;
  final String productName;
  final String review;
  
  /// All fields are required and must not be null.
  ProductEntity({
    required this.id, 
    required this.salePrice, 
    required this.actualPrice, 
    required this.imageUrl, 
    required this.productName, 
    required this.review
  });
}
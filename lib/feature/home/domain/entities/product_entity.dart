/// Represents a product in the domain layer of the application.
/// This entity is used in the Home screen, product lists.
class ProductEntity {
  final int id;
  final int salePrice;
  final int actualPrice;
  final String imageUrl;
  final String productName;
  final int review;
  
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
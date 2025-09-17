/// Represents a product in the domain layer of the application.
/// This entity is used in the WishList Screen.
class WishListEntity {
  final int id;
  final int salePrice;
  final int actualPrice;
  final String imageUrl;
  final String productName;
  final int review;
  
  /// All fields are required and must not be null.
  WishListEntity({
    required this.id, 
    required this.salePrice, 
    required this.actualPrice, 
    required this.imageUrl, 
    required this.productName, 
    required this.review
  });
}
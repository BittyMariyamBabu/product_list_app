/// Represents a banner in the domain layer of the application.
/// This entity is used in the Home screen, banner lists.
class BannerEntity {
  final int id;
  final String bannerImageUrl;
  final String bannerName;
  final int price;

  /// All fields are required and must not be null.
  BannerEntity({
    required this.id,
    required this.bannerImageUrl,
    required this.bannerName,
    required this.price
  });
}
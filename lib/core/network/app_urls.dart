import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final String baseUrl = dotenv.env['API_BASE_URL'] ?? "";
  static const String verify= 'verify/';
  static const String signup = 'login-register/';
  static const String productList = 'products/';
  static const String bannerList = 'banners/';
  static const String userData= 'user-data/';
  static const String wishList = 'wishlist/';
  static const String addRemoveWishList = 'add-remove-wishlist/';
  static const String search = 'search/';
}

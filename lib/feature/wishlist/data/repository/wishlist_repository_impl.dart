import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/feature/wishlist/data/models/wishlist/wishlist_model.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

// class WishlistRepositoryImpl extends WishListRepository{
//   final ApiService apiClient;

//   WishlistRepositoryImpl({required this.apiClient})

//   @override
//   Future<WishListEntity> getWishList() async {
//     final response = await apiClient.get(AppUrls.wishList);
//     final model = WishListModel.fromJson(response.data);
//     return model.toEntity();
//   }

//   @override
//   Future<WishListEntity> addProduct({required WishListEntity item}) async {
//     final response = await apiClient.get(AppUrls.wishList);
//     final model = WishListModel.fromJson(response.data);
//     return model.toEntity();
//   }

//   @override
//   Future<WishListEntity> removeProduct({required String id}) async {
//     final response = await apiClient.get(AppUrls.wishList);
//     final model = WishListModel.fromJson(response.data);
//     return model.toEntity();
//   }
// }
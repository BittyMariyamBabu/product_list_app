import 'package:flutter/material.dart';
import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/feature/wishlist/data/models/wishlist/wishlist_model.dart';
import 'package:product_listing_app/feature/wishlist/domain/entities/wishlist_entity.dart';
import 'package:product_listing_app/feature/wishlist/domain/repositories/wishlist_repository.dart';

class WishlistRepositoryImpl extends WishListRepository{
  final ApiService apiClient;

  WishlistRepositoryImpl({required this.apiClient});

  // Local cache
  final List<String> _localWishlist = [];

  @override
  Future<List<WishListEntity>> getWishList() async {
    debugPrint("Hitting GET wishlist API: ${AppUrls.wishList}");
    final response = await apiClient.get(endpoint: AppUrls.wishList);
    final wishlist  = (response as List)
      .map((e) => WishListModel.fromJson(e).toEntity())
      .toList();
    // Keep cache updated
    _localWishlist.clear();
    _localWishlist.addAll(wishlist.map((e) => e.id.toString()));
    return wishlist;
  }

  @override
  Future<void> toggleProduct({required String productId}) async {
    debugPrint("Toggling product in local wishlist: $productId");
    if (_localWishlist.contains(productId)) {
      _localWishlist.remove(productId);
    } else {
      _localWishlist.add(productId);
    }
  }

  @override
  Future<void> syncWishlist() async {
    debugPrint("Syncing wishlist with backend: ${_localWishlist}");
    // Send local wishlist to backend 
    for (final id in _localWishlist) {
      await apiClient.post(
        endpoint: AppUrls.addRemoveWishList,
        body: {"product_id": id}, // sends each as product_id"
      );
    }
  }
}

import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/feature/home/data/models/banner_model.dart';
import 'package:product_listing_app/feature/home/data/models/product/product_model.dart';
import 'package:product_listing_app/feature/home/domain/entities/banner_entity.dart';
import 'package:product_listing_app/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing_app/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiService apiClient;

  HomeRepositoryImpl({required this.apiClient});
  
  @override
  Future<List<BannerEntity>> getBanners() async {
    final data = await apiClient.get(endpoint: AppUrls.bannerList);
    final banners = (data as List)
      .map((e) => BannerModel.fromJson(e) as BannerEntity)
      .toList();
    return banners;
  }

  @override
  Future<List<ProductEntity>> getProduct() async {
    final data = await apiClient.get(endpoint: AppUrls.productList);
    final products = (data as List)
      .map((e) => ProductModel.fromJson(e).toEntity())
      .toList();
    return products;
  }
}

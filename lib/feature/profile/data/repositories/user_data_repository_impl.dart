import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/feature/profile/data/models/user_data/user_data_model.dart';
import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';
import 'package:product_listing_app/feature/profile/domain/repositories/user_data_repository.dart';

class UserDataRepositoryImpl  extends UserDataRepository{
  final ApiService apiClient;

  UserDataRepositoryImpl({required this.apiClient});

  @override
  Future<UserDataEntity> getUserData() async {
    final response = await apiClient.get(endpoint: AppUrls.userData);
     final verifyUser = UserDataModel.fromJson(response);
    return verifyUser.toEntity();
  }
}
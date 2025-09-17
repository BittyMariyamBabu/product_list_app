import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/feature/auth/data/models/user/user_model.dart';
import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/repsoitories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final ApiService apiClient;

  AuthRepositoryImpl(this.apiClient);

  @override
  Future<UserEntity> sendOtp({required String phone}) async {
    final response = await apiClient.post(AppUrls.login);
    final userModel = UserModel.fromJson(response.data);
    return userModel.toEntity();
  }

  @override
  Future<UserEntity> register({required String phone, required String fullName}) async {
    final response = await apiClient.post(AppUrls.signup);
    final userModel = UserModel.fromJson(response.data);
      return userModel.toEntity();
  }
}
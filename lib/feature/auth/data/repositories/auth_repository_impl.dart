import 'package:product_listing_app/core/network/api_services.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/core/secure_storage/secure_storage.dart';
import 'package:product_listing_app/feature/auth/data/models/user/user_model.dart';
import 'package:product_listing_app/feature/auth/data/models/verify_user/verify_user_model.dart';
import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/repsoitories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final ApiService apiClient;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({required this.apiClient,required this.secureStorage});
  
  // Verify the phone number of user and get the otp
  @override
  Future<VerifyUserEntity> verifyUser({required String phone}) async {
    final response = await apiClient.post(
      endpoint: AppUrls.verify,
      body: {
        "phone_number": phone
      }
    );
    final verifyUser = VerifyUserModel.fromJson(response);
    await secureStorage.write(key: 'auth_token', value: verifyUser.token.access);
    return verifyUser.toEntity();
  }
  
  /// Login & register user and store token securely
  @override
  Future<UserEntity> register({required String phone, required String fullName}) async {
    final response = await apiClient.post(
      endpoint: AppUrls.signup,
      body: {
        "phone_number": phone,
        "first_name": fullName
      }
    );
    final userModel = UserModel.fromJson(response);
    await secureStorage.write(key: 'auth_token', value: userModel.token.access);
    return userModel.toEntity();
  }

  /// Get token from storage
  @override
  Future<String?> getToken() async{
    return await secureStorage.read(key: 'auth_token');
  }
}
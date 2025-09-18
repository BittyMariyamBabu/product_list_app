import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';

abstract class AuthRepository {
  Future<VerifyUserEntity> verifyUser({required String phone});
  Future<UserEntity> register({required String phone, required String fullName});
  Future<String?> getToken();
}
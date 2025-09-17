import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String phone);
  Future<bool> verifyOtp(String phone, String otp);
  Future<UserEntity> saveFullName(String phone, String fullName);
}
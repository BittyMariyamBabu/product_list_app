import 'package:product_listing_app/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> sendOtp({required String phone});
  Future<UserEntity> register({required String phone, required String fullName});
}
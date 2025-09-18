import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';

abstract class UserDataRepository {
  Future<UserDataEntity> getUserData();
}
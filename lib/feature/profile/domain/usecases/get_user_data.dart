import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';
import 'package:product_listing_app/feature/profile/domain/repositories/user_data_repository.dart';

class GetUserDataUseCase {
  final UserDataRepository repository;
  GetUserDataUseCase(this.repository);

  Future<UserDataEntity> call() {
    return repository.getUserData();
  }
}
import 'package:product_listing_app/feature/auth/domain/entities/verify_user_entity.dart';
import 'package:product_listing_app/feature/auth/domain/repsoitories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;
  SendOtpUseCase(this.repository);

  Future<VerifyUserEntity> call({required String phone}) {
    return repository.verifyUser(phone: phone);
  }
}



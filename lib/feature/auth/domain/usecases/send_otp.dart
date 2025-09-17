import 'package:product_listing_app/feature/auth/domain/repsoitories/auth_repository.dart';

class SendOtp {
  final AuthRepository repository;
  SendOtp(this.repository);

  Future<void> call(String phone) => repository.sendOtp(phone);
}



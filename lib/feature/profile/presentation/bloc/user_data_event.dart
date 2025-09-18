import 'package:equatable/equatable.dart';
import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserDataEvent extends UserEvent {
  final UserDataEntity user;

  UserDataEvent(this.user);

  @override
  List<Object> get props => [user];
}



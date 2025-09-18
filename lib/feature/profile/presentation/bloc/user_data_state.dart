import 'package:equatable/equatable.dart';
import 'package:product_listing_app/feature/profile/domain/entity/user_data_entity.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}
class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserDataEntity user;
  UserSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserFailure extends UserState {
  final String message;
  UserFailure(this.message);

  @override
  List<Object> get props => [message];
}

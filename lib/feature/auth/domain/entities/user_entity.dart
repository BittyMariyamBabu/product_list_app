/// Represents a user in the domain layer of the application.
/// This entity is used in the login & signup.
class UserEntity {
  final String id;
  final String token;

  /// All fields are required and must not be null.
  const UserEntity({
    required this.id, 
    required this.token});
}
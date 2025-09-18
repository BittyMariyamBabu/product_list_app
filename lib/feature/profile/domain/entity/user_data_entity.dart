/// Fetch a user in the domain layer of the application.
/// This entity is used in the profile screen.
class UserDataEntity {
  final String name;
  final String phone;

  /// All fields are required and must not be null.
  const UserDataEntity({
    required this.name, 
    required this.phone});
}
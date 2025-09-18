/// Verify a user in the domain layer of the application.
/// This entity is used in the phone verification screen.
class VerifyUserEntity {
  final String otp;
  final bool isUser;
  final String token;

  /// All fields are required and must not be null.
  const VerifyUserEntity( {
    required this.otp, 
    required this.isUser,
    required this.token});
}
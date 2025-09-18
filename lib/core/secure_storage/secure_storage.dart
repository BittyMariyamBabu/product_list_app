import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// FlutterSecureStorage for storing key-value pairs securely.
class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save a value securely
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  /// Read a value securely
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }
  

  /// Delete a value
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  /// Save both token and isUser together
  Future<void> saveTokenAndUser({required String token, required bool isUser}) async {
    await _storage.write(key: 'auth_token', value: token);
    await _storage.write(key: 'is_user', value: isUser ? 'true' : 'false');
  }

  /// get both token and isUser together
  Future<Map<String, dynamic>> getTokenAndUser() async {
    final token = await _storage.read(key: 'auth_token');
    final isUserStr = await _storage.read(key: 'is_user');
    final isUser = isUserStr == 'true';
    return {
      'token': token,
      'isUser': isUser,
    };
  }

   /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final data = await getTokenAndUser();
    return data['token'] != null && (data['token'] as String).isNotEmpty && data['isUser'] == true;
  }
   /// Clear both token and isUser
  Future<void> clearTokenAndUser() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'is_user');
  }
}

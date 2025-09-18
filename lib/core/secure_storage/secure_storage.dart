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
}

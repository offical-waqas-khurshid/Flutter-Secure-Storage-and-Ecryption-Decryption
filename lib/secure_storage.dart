import 'package:demo/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  /// create Object of Flutter Secure Storage
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  /// Create object of Utils Class to use his functions and properties
  final Utils utils = Utils();

  /// Write Data Function
  writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  /// Read Data Function
  Future<String> readData(String key) async {
    return await storage.read(key: key) ?? 'No data found!';
  }

  /// Delete All Data from Secure Storage
  Future<void> deleteAllData() async {
    return await storage.deleteAll();
  }

  /// Delete One item from Secure Storage
  Future<void> deleteData(String key) async {
    return await storage.delete(key: key);
  }

  /// Check if a specific key exists in the Secure Storage
  Future<bool> doesKeyExist(String key) async {
    return await storage.containsKey(key: key);
  }

  /// Retrieve a list of all keys currently stored
  Future<List<String>> getAllKeys() async {
    final allData = await storage.readAll();
    return allData.keys.toList();
  }

  /// Store multiple key-value pairs in a single operation from Secure Storage
  Future<void> writeMultipleData(Map<String, String> data) async {
    data.forEach((key, value) async {
      await storage.write(key: key, value: value);
    });
  }

  /// Remove multiple key-value pairs with a list of keys from Secure Storage
  Future<void> deleteMultipleData(List<String> keys) async {
    for (var key in keys) {
      await storage.delete(key: key);
    }
  }

  /// Update Data based on new key and value of Secure Storage
  Future<void> updateData(String key, String updatedValue) async {
    // Read the existing value
    final existingValue = await storage.read(key: key);

    if (existingValue != null) {
      // Modify the value, e.g., concatenate a new string
      final newValue = '$existingValue, $updatedValue';

      // Write the updated value back to the same key
      await storage.write(key: key, value: newValue);
    } else {
      print('Key does not exist.');
    }
  }
}

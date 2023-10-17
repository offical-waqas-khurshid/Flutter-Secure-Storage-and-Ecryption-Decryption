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

  /// Delete All Data Function
  deleteData(String key) async {
    await storage.delete(key: key);
  }

  /// Delete One item from Secure Storage Database
}

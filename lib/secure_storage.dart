import 'package:demo/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

 readSecureData(String key) async {
    Utils utils = Utils();
   String value = await storage.read(key: key) ?? 'No data found!';
    print('Data read from secure storage: $value');
     String data = utils.decrypt(value);
    print('Data read from secure storage: $data');
    return data;
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
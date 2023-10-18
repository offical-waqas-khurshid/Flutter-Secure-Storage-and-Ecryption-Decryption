import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class Utils {
  /// Your private key
  final key = Key.fromUtf8('15helloTCJTALK2015helloTCJTALK20');

  /// Your encrypted based length i.e. 16,32,64
  final iv = IV.fromLength(32);

  /// Encrypt a message
  String encrypt(String message) {
    final encrypter = Encrypter(AES(key, mode: AESMode.gcm, padding: null));
    final encrypted = encrypter.encrypt(message, iv: iv);
    return base64.encode(encrypted.bytes);
  }

  /// Decrypt an encrypted message
  String decrypt(String encryptedMessage) {
    final encrypter = Encrypter(AES(key, mode: AESMode.gcm, padding: null));
    final encrypted = Encrypted.fromBase64(encryptedMessage);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }

  /// Encrypt multiple data
  Map<String, String> encryptMultipleData(Map<String, String> data) {
    final encryptedData = <String, String>{};
    data.forEach((key, value) {
      final encryptedValue = encrypt(value);
      encryptedData[key] = encryptedValue;
    });
    return encryptedData;
  }
}

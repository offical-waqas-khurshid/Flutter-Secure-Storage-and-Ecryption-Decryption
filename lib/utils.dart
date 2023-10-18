import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class Utils {
  /// Your private key
  final key = Key.fromUtf8('15helloTCJTALK20');

  /// Your encrypted based length i.e. 16,32,64
  final iv = IV.fromLength(16);

  /// Encrypt a message
  String encrypt(String message) {
    final encrypter = Encrypter(AES(key,mode: AESMode.cbc, padding: "PKCS7"));
    final encrypted = encrypter.encrypt(message, iv: iv);
    return base64.encode(encrypted.bytes);
  }

  /// Decrypt an encrypted message
  String decrypt(String encryptedMessage) {
    final encrypter = Encrypter(AES(key, mode:AESMode.cbc, padding: "PKCS7"));
    final encrypted = Encrypted.fromBase64(encryptedMessage);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
    // final encrypter = Encrypter(AES(key, mode:AESMode.cbc, padding: "PKCS7"));
    // final decoded = base64.decode(encryptedMessage);
    // final decrypted = encrypter.decrypt(Encrypted(decoded), iv: iv);
    //return decrypted;
  }
}

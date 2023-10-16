import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class Utils{
  final key = Key.fromUtf8('15helloTCJTALK20');
  final iv = IV.fromLength(16);

// Encrypt a message
  String encrypt(String message) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(message, iv: iv);
    return base64.encode(encrypted.bytes);
  }

// Decrypt an encrypted message
  String decrypt(String encryptedMessage) {
    final encrypter = Encrypter(AES(key));
    final decoded = base64.decode(encryptedMessage);
    final decrypted = encrypter.decrypt(Encrypted(decoded), iv: iv);
    return decrypted;
  }
}
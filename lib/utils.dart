import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class Utils{
  final key = Key.fromUtf8('H4WtkvK4qyehIe2kjQfH7we1xIHFK67e');
  final iv = IV.fromUtf8('HgNRbGHbDSz9T0CC');




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
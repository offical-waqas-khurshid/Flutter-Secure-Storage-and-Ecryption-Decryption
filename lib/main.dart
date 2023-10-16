import 'package:demo/home_screen.dart';
import 'package:flutter/material.dart' hide Key;

void main() async {
  runApp(const MyApp());

  // String plainText = "waqas12345";
  // final key = Key.fromLength(32);
  // final iv = IV.fromLength(8);
  // final encrypter = Encrypter(AES(key));
  //
  // Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);
  // String encryptedData = encrypted.base64;
  //
  // print("The Encypted Data is = " + encryptedData);
  //
  // String decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedData), iv: iv);
  // print("The Decrypted Form is = $decrypted");
  // print("The Encrypted Form base16 is = ${encrypted.base16}");
  // print("The Encrypted Form base64 is = ${encrypted.base16}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  const HomePage(),
    );
  }
}
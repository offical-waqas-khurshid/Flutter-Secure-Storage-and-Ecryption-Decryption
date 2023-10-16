import 'package:demo/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;
  SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, color: Colors.grey, size: 100),
            const Text('Storing data securely using Flutter Secure Storage',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    // won't be used if the state-specific arguments are defined
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 5.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var result = secureStorage.writeSecureData(
                      'name', textEditingController.text);
                  print("The write data is = $result");
                },
                child: const Text("Add Data")),
            ElevatedButton(
                onPressed: () {
                  var readResult = secureStorage.readSecureData('name');
                  print("The Read data is = $readResult");
                },
                child: const Text("Read Data")),
            ElevatedButton(
                onPressed: () {
                  secureStorage.deleteSecureData("name");
                },
                child: const Text("Delete Data")),
          ],
        ),
      ),
    );
  }
}

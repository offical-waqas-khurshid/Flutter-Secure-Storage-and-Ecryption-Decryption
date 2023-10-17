import 'package:demo/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController nameTextEditingController;
  late TextEditingController passwordTextEditingController;
  SecureStorage secureStorage = SecureStorage();

  var result;
  var writeMultiple;

  @override
  void initState() {
    nameTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security, color: Colors.grey, size: 100),
              const Text('Storing data securely using Flutter Secure Storage',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameTextEditingController,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordTextEditingController,
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
                    print(
                        "The text of TextEditingController = ${nameTextEditingController.text}");
                    String encryptedMessage = secureStorage.utils
                        .encrypt(nameTextEditingController.text);
                    print(
                        "Result data after apply encryption = $encryptedMessage");
                    result = secureStorage.writeData('name', encryptedMessage);
                    print(
                        "The write data in Flutter_Secure_Storage  = $result");
                  },
                  child: const Text("Add Data")),
              ElevatedButton(
                  onPressed: () async {
                    String value = await secureStorage.readData('name1');
                    print(
                        "The write read from Flutter_Secure_Storage = $value");
                    String decryptedMessage =
                        secureStorage.utils.decrypt(value);
                    print(
                        "The decrypted message from Flutter_Secure_Storage = $decryptedMessage");
                  },
                  child: const Text("Read Data")),
              ElevatedButton(
                  onPressed: () async {
                    await secureStorage.readAllData();
                  },
                  child: const Text("Read All Data")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.deleteData("name");
                  },
                  child: const Text("Delete Data")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.deleteAllData();
                  },
                  child: const Text("Delete All Data")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.doesKeyExist("name");
                  },
                  child: const Text("Does key Exits")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.deleteData("name");
                  },
                  child: const Text("Get All Keys")),
              ElevatedButton(
                  onPressed: () {
                    final dataToStore = {
                      'name1': nameTextEditingController.text,
                      'password1': passwordTextEditingController.text,
                      'key3': 'value3',
                    };
                    writeMultiple =
                        secureStorage.writeMultipleData(dataToStore);
                    print("The write multiple $writeMultiple");
                  },
                  child: const Text("Write Multiple Data")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.deleteData("name");
                  },
                  child: const Text("Delete Multiple Data")),
              ElevatedButton(
                  onPressed: () {
                    secureStorage.deleteData("name");
                  },
                  child: const Text("Update Data one Field")),
            ],
          ),
        ),
      ),
    );
  }
}

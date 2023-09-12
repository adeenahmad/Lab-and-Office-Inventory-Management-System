import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:inventory_system/URL/base_url.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController inchargeOfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    showDialogBox(BuildContext context, String data) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(""),
            content: Text(data),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    final client = Dio();
    const url = '${BaseUrl.url}BIIT_LOIS_API/api/Lois/addUser';

    addUser(BuildContext context) async {
      final data = {
        "Email": usernameController.text,
        "Password": passwordController.text,
        "InchargeOf": inchargeOfController.text,
      };
      try {
        final response = await client.post(url, data: data);
        showDialogBox(context, response.data);
      } catch (e) {
        // Handle error
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: inchargeOfController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Incharge Of',
                hintText: 'Enter Incharge of',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addUser(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}

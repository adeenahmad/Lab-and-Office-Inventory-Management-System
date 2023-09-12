import 'package:flutter/material.dart';
import 'package:inventory_system/Json_Model/login_model.dart';
import 'package:inventory_system/home.dart';
import 'package:dio/dio.dart';

import 'URL/base_url.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  showLoginFailedtDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Login Failed"),
      content: const Text("Please try again with correct email or password"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final client = Dio();
  LoginModel? loginModel;

  Future<LoginModel?> loginUser() async {
    try {
      final url =
          '${BaseUrl.url}BIIT_LOIS_API/api/Lois/userLogin?email=${emailController.text}&password=${passwordController.text}';
      final response = await client.get(url);

      if (response.statusCode == 200) {
        debugPrint("response:::${response.data}");
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
        return LoginModel.fromJson(response.data);
      } else if (response.statusCode != 200) {
        showLoginFailedtDialog(context);
      } else {
        debugPrint("error");
        print(
            'status code : ${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      showLoginFailedtDialog(context);
    }
    return loginModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 135),
              child: const Text(
                'Welcome Back',
                style: TextStyle(color: Colors.white70, fontSize: 35),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: 35,
                    right: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade50,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade50,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sign In',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 27,
                                fontWeight: FontWeight.w700)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.lightBlueAccent,
                          child: IconButton(
                              onPressed: () async {
                                loginModel = await loginUser();
                                print("login username: ${loginModel!.email}");
                                print("login id: ${loginModel!.uID}");
                              },
                              icon: const Icon(Icons.arrow_forward)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

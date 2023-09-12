import 'package:flutter/material.dart';
import 'package:inventory_system/Admin/Admin_Home.dart';
import 'package:inventory_system/Admin/Admin_Login.dart';
import 'package:inventory_system/login.dart';

import 'home.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                    top: MediaQuery.of(context).size.height * 0.3,
                    left: 35,
                    right: 35),
                child: Column(
                  children: [

                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sign In as Admin',style:TextStyle(color:Colors.black,fontSize: 27,fontWeight: FontWeight.w700)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: IconButton( onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const AdminLogin())),
                              icon:const Icon(Icons.arrow_forward) ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text('Sign In as User',style:TextStyle(color:Colors.indigo,fontSize: 27,fontWeight: FontWeight.w700)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.indigo,
                          child: IconButton( onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const MyLogin())),
                              icon:const Icon(Icons.arrow_forward) ),
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


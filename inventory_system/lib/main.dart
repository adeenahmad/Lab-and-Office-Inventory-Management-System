

import 'package:flutter/material.dart';
import 'package:inventory_system/Welcome.dart';
import 'package:inventory_system/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Welcome',
    routes: {'Welcome': (context)=>const Welcome()},
  ));
}


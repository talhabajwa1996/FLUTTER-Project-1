import 'package:flutter/material.dart';
import 'src/pages/1-login.dart';
import 'package:App_Project1/src/pages/2-home.dart';
import 'package:App_Project1/src/pages/3-profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      home: HomePage(),
      //home: ProfilePage()
    );
  }
}

import 'package:flutter/material.dart';
import 'src/pages/1-login.dart';
import 'src/BLOC/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

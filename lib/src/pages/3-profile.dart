import 'package:flutter/material.dart';
import '../mixins/email&passwordMixin.dart';

class ProfilePage extends StatelessWidget with EmailAndPasswordFields {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              email(),
              SizedBox(height: 8.0),
              password(),
              SizedBox(height: 8.0),
              submitButton('Logout'),
            ],
          ),
        ),
      ),
    );
  }
}

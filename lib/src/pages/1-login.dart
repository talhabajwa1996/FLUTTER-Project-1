import 'package:flutter/material.dart';
import '../mixins/email&passwordMixin.dart';

class LoginPage extends StatelessWidget with EmailAndPasswordFields {
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              email(),
              SizedBox(height: 8.0),
              password(),
              SizedBox(height: 8.0),
              submitButton('Submit'),
            ],
          ),
        ),
      ),
    );
  }

}
